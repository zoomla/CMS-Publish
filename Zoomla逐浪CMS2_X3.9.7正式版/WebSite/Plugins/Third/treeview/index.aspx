<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ZoomLaCMS.Plugins.Third.treeview.index" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="tree"></div>
    <asp:HiddenField runat="server" ID="data_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <link href="bootstrap-treeview.min.css" rel="stylesheet" />
    <script src="bootstrap-treeview.js"></script>
    <script>
        var tree = [
  {
      text: "Parent 1",
     
      nodes: [
        {
            text: "Child 1",
            nodes: [
              {
                  text: "Grandchild 1"
              },
              {
                  text: "Grandchild 2"
              }
            ]
        },
        {
            text: "Child 2",
            href:"this is a href"
        }
      ]
  },
  {text: "Parent 2"},
  {text: "Parent 3"},
        ];
        $(function () {

            if ($("#data_hid").val() != "") { tree = JSON.parse($("#data_hid").val()); }
            console.log(tree);
            $('#tree').treeview({
                data: tree,
                onNodeSelected: function (event, node) {
                    console.log("selected", node.text, node.href);
                },
                onNodeUnselected: function (event, node) {
                }
            });
        })
    
    </script>
    
   <%--{
  text: "Node 1",
  icon: "glyphicon glyphicon-stop",
  selectedIcon: "glyphicon glyphicon-stop",
  color: "#000000",
  backColor: "#FFFFFF",
  href: "#node-1",
  selectable: true,
  state: {
    checked: true,
    disabled: true,
    expanded: true,
    selected: true
  },
  tags: ['available'],
  nodes: [
    {},
    ...
  ]
} --%>
</asp:Content>