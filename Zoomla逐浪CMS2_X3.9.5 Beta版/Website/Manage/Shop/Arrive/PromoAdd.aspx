<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromoAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.PromoAdd" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">编辑优惠活动</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="td_m"><strong>活动名称：</strong></td>
            <td>
                <ZL:TextBox ID="Name_T" runat="server" AllowEmpty="false" CssClass="form-control text_300" />
            </td>
        </tr>
        <tr>
            <td><strong>参与商品：</strong></td>
            <td>
                <div class="marginbot10">
                    <input type="button" class="btn btn-info" value="添加商品" onclick="OpenSelect();" />
                    <input type="button" class="btn btn-info" value="移除选定捆绑" onclick="RemoveBind();" />
                </div>
                <table id="bindpro_table" class="table table-striped table-bordered">
                    <tr>
                        <td>ID</td>
                        <td>商品图片</td>
                        <td>零售价</td>
                        <td>商品名称</td>
                    </tr>
                    <tbody id="bindpro_body"></tbody>
                </table>
                <asp:HiddenField runat="server" ID="Bind_Hid" />
            </td>
        </tr>
        <%--<tr>
            <td><strong>参与会员组：</strong></td>
            <td></td>
        </tr>--%>
        <tr>
            <td><strong>开始时间：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="StartTime_T" CssClass="form-control text_md" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'EndTime_T\')}',dateFmt:'yyyy-MM-dd HH:mm:ss'});" />

            </td>
        </tr>
        <tr>
            <td><strong>结束时间：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="EndTime_T" CssClass="form-control text_md" onclick="WdatePicker({minDate:'#F{$dp.$D(\'StartTime_T\')}',dateFmt:'yyyy-MM-dd HH:mm:ss'});" />
            </td>
        </tr>
        <tr>
            <td><strong>金额下限：</strong></td>
            <td>
                <ZL:TextBox ID="MoneyLL_T" runat="server" CssClass="form-control text_md" AllowEmpty="false" ValidType="FloatZeroPostive" />
            </td>
        </tr>
        <tr>
            <td><strong>金额上限：</strong></td>
            <td>
                <ZL:TextBox ID="MoneyUL_T" runat="server" CssClass="form-control text_md" AllowEmpty="false" ValidType="FloatZeroPostive" />
            </td>
        </tr>
        <%--<tr>
            <td><strong>优惠方式：</strong></td>
            <td></td>
        </tr>--%>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_B" runat="server" OnClick="Save_B_Click" CssClass="btn btn-info" Text="保存" />
                <a href="PromoList.aspx" class="btn btn-info">取消</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        $(function () {
            BindPro($("#Bind_Hid").val());
        });
        var diag = new ZL_Dialog();
        function RemoveBind() {
            var $chks = $("input[name=bind_chk]:checked");
            if ($chks.length < 1) { alert("请先选中需要清除的捆绑"); return false; }
            var bindArr = JSON.parse($("#Bind_Hid").val());
            $chks.each(function () {
                bindArr.RemoveByID($(this).val());
            });
            if (bindArr.length < 1) { $("#Bind_Hid").val(""); }
            else { $("#Bind_Hid").val(JSON.stringify(bindArr)); }
            BindPro();
        }
        function OpenSelect() {
            diag.title = "添加商品";
            diag.maxbtn = false;
            diag.width = "none";
            diag.url = "/Common/AddbindPro.aspx?filter=admin";
            diag.ShowModal();
        }
        function BindPro(projson) {
            if (projson) { $("#Bind_Hid").val(projson); }
            if ($("#Bind_Hid").val() == "") { $("#bindpro_body").html(""); return; }
            $(".td_binddata").remove();//清空之前捆绑数据
            var proattr = [];
            try { proattr = JSON.parse($("#Bind_Hid").val()); } catch (ex) { }
            var trtlp = "<tr class='td_binddata'><td class='td_s'><label><input type='checkbox' name='bind_chk' value='@id'>@id</label></td><td class='td_m'><img onerror=\"shownopic(this);\" style='width:60px;height:45px;' src='/@Thumbnails' /></td><td class='td_m'>@LinPrice</td><td>@Proname</td></tr>";
            var html = JsonHelper.FillData(trtlp, proattr);
            $("#bindpro_body").append(html);
        }
        function CloseDiag() {
            diag.CloseModal();
            comdiag.CloseModal();
        }
    </script>
</asp:Content>
