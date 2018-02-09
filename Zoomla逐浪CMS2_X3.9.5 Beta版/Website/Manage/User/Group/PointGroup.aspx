<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointGroup.aspx.cs" Inherits="ZoomLaCMS.Manage.User.PointGroup"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.用户积分等级 %></title>
	<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
	new Bread("/{manage}/User/UserManage.aspx","会员管理"),
	new Bread() {url=Request.RawUrl, text="等级管理[<a href='AddPointGroup.aspx'>添加等级</a>]",addon= "" }},
	Call.GetHelp(2)
	)
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<div class="tab-content col-12 table_box">
  <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" 
      AutoGenerateColumns="False" PageSize="10" class="table table-striped table-bordered" OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging">
	  <Columns>
          <asp:TemplateField ItemStyle-CssClass="td_xs">
              <ItemTemplate>
                  <input type="checkbox" value="<%#Eval("ID") %>" name="idchk"/>
              </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s"/>
		  <asp:TemplateField HeaderText="图标" ItemStyle-CssClass="td_m">
			  <ItemTemplate>
                  <img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Image")) %>" style="width:50px;"/>
			  </ItemTemplate>
		  </asp:TemplateField>
          <asp:BoundField HeaderText="名称" DataField="Alias"/>
          <asp:TemplateField HeaderText="等级" ItemStyle-CssClass="td_m">
              <ItemTemplate>
                  <input type="text" class="form-control orderItem" data-id="<%#Eval("ID") %>" value="<%#Eval("OrderID") %>"/>
              </ItemTemplate>
          </asp:TemplateField>
		  <asp:BoundField DataField="Remark" HeaderText="备注" ItemStyle-CssClass="td_l"/>
		  <asp:TemplateField HeaderText="<%$Resources:L, 操作%>" ItemStyle-CssClass="td_m">
              <ItemTemplate>
                  <a href="AddPointGroup.aspx?ID=<%#Eval("ID") %>"><i class="fa fa-pencil" title="<%=Resources.L.修改 %>"></i></a>
                  <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2"
                      OnClientClick="return confirm('确认删除？')"><i class="fa fa-trash-o"></i>删除</asp:LinkButton>
              </ItemTemplate>
          </asp:TemplateField>
	  </Columns>
  </ZL:ExGridView>
  <div>
      <asp:HiddenField runat="server" ID="OrderInfo_Hid" />
      <asp:Button runat="server" ID="SaveOrder_Btn" Text="保存等级排序" OnClick="SaveOrder_Btn_Click" OnClientClick="return saveOrder();" class="btn btn-info" />
  </div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">    
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    function getinfo(id) {
        location.href = "AddPointGroup.aspx?id=" + id;
    }
    function saveOrder() {
        var list = [];
        $(".orderItem").each(function () {
            var $item = $(this);
            var model = {
                "id": Convert.ToInt($item.data("id")),
                "order": Convert.ToInt($item.val())
            }
            if (model.order < 1) { alert("等级不能小于1"); return false; }
            list.push(model);
        });
        if (list.length < 1) { alert("没有需要操作的数据"); return false; }
        $("#OrderInfo_Hid").val(JSON.stringify(list));
        return true;
    }
</script>
</asp:Content>