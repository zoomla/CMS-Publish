using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Model;

namespace ZoomLaCMS.Tools.UpdateCMS
{
    public partial class Default : System.Web.UI.Page
    {
        private List<string> IgnoreDirs = new List<string>() {
            "/UploadFiles/","/Log/","/CMSPlugins/","/Template/","/temp/","/Tools/","/Config/","/Design/","/App_Data/" };//兼容旧版
        private List<string> IgnoreFiles = new List<string>() { "/Log.txt", "/favicon.ico", "/Web.config", "/PrecompiledApp.config" };
        public string NewDir { get { return NewCMSDir_T.Text.Trim(); } }
        public string NowDir { get { return Server.MapPath("/"); } }
        public DataTable CompareDT
        {
            get { return Session["CompareDT"] as DataTable; }
            set { Session["CompareDT"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            M_AdminInfo adminMod = B_Admin.GetLogin();
            if (adminMod == null) { Response.Redirect(CustomerPageAction.customPath + "Login"); }
            if (!adminMod.IsSuperAdmin()) { function.WriteErrMsg("你没有访问该页面的权限"); }
            if (!IsPostBack)
            {
                CMSUpdateCfg.LoadFromFile();
                foreach (string item in CMSUpdateCfg.Info.Ignores)
                {
                    Ignore_T.Text += item + "\r";
                }
                NewCMSDir_T.Text = CMSUpdateCfg.Info.NewDir;
            }
        }
        protected void BeginCheck_Btn_Click(object sender, EventArgs e)
        {
            CheckSiteFiles();
            RPT.DataSource = CompareDT;
            RPT.DataBind();
            remind_div.Visible = CompareDT.Rows.Count < 1;
        }
        protected void CopyBin_Btn_Click(object sender, EventArgs e)
        {
            IOHelper.Dir_Copy(NewDir + @"Bin\", NowDir + @"Bin\");
            function.WriteSuccessMsg("Bin目录更新完成");
        }
        //---------------
        protected void CMSUpdate_Btn_Click(object sender, EventArgs e)
        {
            CheckSiteFiles();
            remind_div.Visible = CompareDT.Rows.Count < 1;
            if (CompareDT.Rows.Count > 0)
            {
                foreach (DataRow dr in CompareDT.Rows)
                {
                    IOHelper.File_Copy(dr["FullPath"].ToString(), function.VToP(dr["VPath"].ToString()));
                }
                UpdateVersion();
                RPT.DataSource = CompareDT;
                RPT.DataBind();
            }          
        }
        protected void SaveCfg_Btn_Click(object sender, EventArgs e)
        {
            CMSUpdateCfg.Info.Ignores = new List<string>();
            if (!string.IsNullOrWhiteSpace(Ignore_T.Text))
            {
                CMSUpdateCfg.Info.Ignores.AddRange(Ignore_T.Text.Split("\r".ToCharArray(), StringSplitOptions.RemoveEmptyEntries));
            }
            CMSUpdateCfg.Info.NewDir = NewDir.Trim();
            CMSUpdateCfg.Update();
            function.WriteSuccessMsg("配置更新完成");
        }
        //--------------------------------------
        private void GetDirectoryInfos(string baseDir, string dir, DataTable table)
        {
            dir = dir.TrimEnd('\\') + "\\";
            string vdir = PToV(baseDir, dir).ToLower();
            if (IgnoreDirs.FirstOrDefault(p => vdir.StartsWith(p.ToLower())) != null)
            {
                return;
            }
            {
                //如果是目录则递归,我们只对比文件
                string[] dirs = Directory.GetDirectories(dir);
                foreach (string dirPath in dirs)
                {
                    GetDirectoryInfos(baseDir, dirPath, table);
                }
            }
            {
                string[] files = Directory.GetFiles(dir);
                for (int num = 0; num < files.Length; num++)
                {
                    string vpath = PToV(baseDir, files[num]).ToLower();
                    //忽略数据库与网站的备份文件
                    if (vpath.EndsWith(".zip") || vpath.EndsWith(".rar") || vpath.EndsWith(".bak")) { continue; }
                    if (IgnoreFiles.FirstOrDefault(p => vpath.StartsWith(p.ToLower())) != null)
                    {
                        continue;
                    }
                    DataRow row = table.NewRow();
                    //FileInfo info = new FileInfo(files[num]);
                    row["Name"] = Path.GetFileName(files[num]);
                    //row["LastWriteTime"] = info.LastWriteTime;
                    row["FullPath"] = files[num];
                    row["ID"] = num;
                    row["VPath"] = PToV(baseDir, files[num]);
                    table.Rows.Add(row);
                }
            }
            //for (int i = 0; i < table.Rows.Count; i++)
            //{
            //    table.Rows[i]["ID"] = (i + 1);
            //}
        }
        private string PToV(string basePath, string ppath)
        {
            ppath = ppath.Replace(@"\\", "\\");
            ppath = ppath.Replace(basePath, "");
            ppath = ppath.Replace(@"\", "/");
            return ("/" + ppath).Replace("//", "/");//避免有些带/有些不带
        }
        private DataTable GetDTFormat()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Name", typeof(string));
            //table.Columns.Add("LastWriteTime", typeof(DateTime));
            table.Columns.Add("FullPath", typeof(string));//全路径,主要用于文件夹，可以打开下一文件
            table.Columns.Add("ID", typeof(int));//索引
            table.Columns.Add("VPath", typeof(string));
            table.Columns.Add("Compare", typeof(int));
            return table;
        }
        private bool CompareFile(string file1, string file2)
        {
            if (file1 == file2) { return true; }
            int file1byte = 0, file2byte = 0;
            FileStream fs1 = null, fs2 = null;
            try
            {
                fs1 = new FileStream(file1, FileMode.Open);
                fs2 = new FileStream(file2, FileMode.Open);
                // 检查文件大小。如果两个文件的大小并不相同，则视为不相同。
                if (fs1.Length != fs2.Length)
                {
                    return false;
                }
                // 逐一比较两个文件的每一个字节，直到发现不相符或已到达文件尾端为止。
                do
                {
                    // 从每一个文件读取一个字节。
                    file1byte = fs1.ReadByte();
                    file2byte = fs2.ReadByte();
                } while ((file1byte == file2byte) && (file1byte != -1));
            }
            catch { }
            finally
            {
                if (fs1 != null) { fs1.Close(); }
                if (fs2 != null) { fs2.Close(); }
            }
            return ((file1byte - file2byte) == 0);
        }
        private void UpdateVersion()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(NewDir + @"\Config\AppSettings.config");
            string newVersion = xmlDoc.SelectSingleNode("//appSettings/add[@key='Version']").Attributes["value"].Value;

            string ppath = function.VToP("/Config/AppSettings.config");
            xmlDoc.Load(ppath);
            xmlDoc.SelectSingleNode("//appSettings/add[@key='Version']").Attributes["value"].Value = newVersion;
            xmlDoc.Save(ppath);
        }
        private DataTable CheckSiteFiles()
        {
            CompareDT = null;
            if (string.IsNullOrEmpty(NewDir) || !Directory.Exists(NewDir))
            {
                function.WriteErrMsg("目录[" + NewDir + "]不存在");
            }
            //---------------------------
            IgnoreDirs.AddRange(CMSUpdateCfg.Info.Ignores);
            IgnoreFiles.AddRange(CMSUpdateCfg.Info.Ignores);
            DataTable newDT = GetDTFormat();
            //DataTable nowDT = GetDTFormat();
            GetDirectoryInfos(NewDir, NewDir, newDT);
            //修改为,不需要便历,根据NewDir中的信息进行查找??
            //GetDirectoryInfos(NowDir, NowDir, nowDT);
            //开始对比差异
            for (int i = 0; i < newDT.Rows.Count; i++)
            {
                DataRow newDR = newDT.Rows[i];
                string ppath = function.VToP(newDR["VPath"].ToString());
                if (!File.Exists(ppath))
                {
                    //缺少文件,需增加
                    newDR["Compare"] = 1;
                }
                else if (!CompareFile(newDR["FullPath"].ToString(), ppath))
                {
                    //文件不匹配,需更新
                    newDR["Compare"] = 2;
                }
                else { newDR["Compare"] = 99; }
            }
            newDT.DefaultView.RowFilter = "Compare IN (1,2)";
            newDT.DefaultView.Sort = "Compare";
            CompareDT = newDT.DefaultView.ToTable();
            return CompareDT;
        }
    }
    public class CMSUpdateCfg
    {
        static readonly string FilePath = function.VToP("/Config/XMLDB/UpdateCMS.json");
        public static CMSUpdateInfo Info = new CMSUpdateInfo();
        public static void LoadFromFile()
        {
            if (!File.Exists(FilePath)) { return; }
            string text = File.ReadAllText(FilePath);
            Info = JsonConvert.DeserializeObject<CMSUpdateInfo>(text);
        }
        public static void Update()
        {
            string text = JsonConvert.SerializeObject(Info);
            if (!Directory.Exists(Path.GetDirectoryName(FilePath))) { Directory.CreateDirectory(Path.GetDirectoryName(FilePath)); }
            File.WriteAllText(FilePath,text);
        }
    }
    public class CMSUpdateInfo
    {
        public List<string> Ignores = new List<string>();
        public string NewDir = "";
    }
    public class IOHelper
    {
        /// <summary>
        /// 返回目录名称
        /// </summary>
        public static string Dir_GetName(string dirPath)
        {
            if (string.IsNullOrEmpty(dirPath)) { return ""; }
            dirPath = dirPath.Trim('\\');
            int start = dirPath.LastIndexOf(@"\") + 1;
            int len = dirPath.Length - start;
            return dirPath.Substring(start, len);
        }
        /// <summary>
        /// 文件拷贝
        /// </summary>
        /// <param name="src">来源文件物理路径</param>
        /// <param name="tar">目标文件地址物理路径</param>
        /// <returns></returns>
        public static CommonReturn File_Copy(string src, string tar)
        {
            try
            {
                if (!File.Exists(src)) { return CommonReturn.Failed("[" + src + "]文件不存在"); }
                if (!Directory.Exists(Path.GetDirectoryName(tar))) { Directory.CreateDirectory(Path.GetDirectoryName(tar)); }
                if (File.Exists(tar)) { File.Delete(tar); }
                File.Copy(src, tar);
            }
            catch (Exception ex) { return CommonReturn.Failed(ex.Message); }
            return CommonReturn.Success();
        }
        public static CommonReturn Dir_Copy(string srcdir, string tardir)
        {
            if (!Directory.Exists(srcdir)) { return CommonReturn.Failed("[" + srcdir + "]目录不存在"); }
            if (!Directory.Exists(tardir)) { Directory.CreateDirectory(tardir); }
            srcdir = srcdir.Trim('\\') + "\\";
            tardir = tardir.Trim('\\') + "\\";
            //----------------------
            string[] fnames = Directory.GetFileSystemEntries(srcdir);
            foreach (string name in fnames)
            {
                try
                {
                    if (Directory.Exists(name))//如果是目录则拷贝
                    {
                        string currentdir = tardir + Dir_GetName(name);
                        if (!Directory.Exists(currentdir))
                        {
                            Directory.CreateDirectory(currentdir);
                        }
                        Dir_Copy(name, currentdir);//递归拷贝
                    }
                    else
                    {
                        CommonReturn retMod = File_Copy(name, tardir + Path.GetFileName(name));
                        if (!retMod.isok) { throw new Exception(retMod.err); }
                    }
                }
                catch (Exception ex) { return CommonReturn.Failed("[" + name + "]" + ex.Message); }
            }
            return CommonReturn.Success();
        }
        public static string GetMD5HashFromFile(string ppath)
        {
            FileStream fs = new FileStream(ppath, FileMode.Open);
            string md5 = GetMD5HashFromFile(fs);
            fs.Close(); fs.Dispose();
            return md5;
        }
        public static string GetMD5HashFromFile(Stream sr)
        {
            System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] retVal = md5.ComputeHash(sr);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < retVal.Length; i++)
            {
                sb.Append(retVal[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }
    public class CommonReturn
    {
        public static CommonReturn Success()
        {
            CommonReturn model = new CommonReturn();
            return model;
        }
        public static CommonReturn Success(object instance)
        {
            CommonReturn model = new CommonReturn();
            model.model = instance;
            return model;
        }
        public static CommonReturn Failed(string msg)
        {
            CommonReturn model = new CommonReturn();
            model.isok = false;
            model.err = msg;
            return model;
        }
        public bool isok = true;
        public string err = "";
        public string addon = "";
        public object model = null;
    }
}