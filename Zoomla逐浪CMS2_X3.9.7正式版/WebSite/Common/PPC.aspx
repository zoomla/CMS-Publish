<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PPC.aspx.cs" Inherits="ZoomLaCMS.Common.PPC" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="/JS/Controls/ZL_PCC.js"></script>
<link href="/App_Themes/V4User.css?version=0ff34de20180408" rel="stylesheet"/>
<title>多级选择</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="three_div" runat="server" visible="false">
<script src="/JS/ICMS/area.js"></script>
<div class="d-flex flex-wrap">
<select id="tbProvince" class="form-control map_w"></select>
<select id="tbCity" class="form-control map_w"></select>
<select id="tbCounty" class="form-control map_w"></select></div>
<script>
    function setPCC(config) {
        var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
        pcc.SetDef(config.province, config.city, config.county);
        pcc.ProvinceInit();
    }
</script>
<script>
    $(function () {
        var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
        $("#address").val('<%=FValue %>');
        if ($("#address").val() != "") {
            var defdata = $("#address").val().split(',');
            pcc.SetDef(defdata[0], defdata[1], defdata[2]);
        }
        pcc.ProvinceInit();
        $("select").change(function () {
            parent.SetCitys('<%=FieldName %>', $("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val())
        });
    });
</script>
</div>
<div runat="server" id="school_div" class="d-flex justify-content-start" visible="false">
    <script src="/JS/ICMS/AreaSchool.js"></script>
    <select id="tbProvince" class="form-control map_w"></select>
    <select id="tbCity" class="form-control map_w"></select>
    <select id="tbCounty" class="form-control map_w" style="display:none;"></select>
    <script>
        $(function () {
            var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
               $("#address").val('<%=FValue %>');
        if ($("#address").val() != "") {
            var defdata = $("#address").val().split(',');
            pcc.SetDef(defdata[0], defdata[1], defdata[2]);
        }
       pcc.ProvinceInit();
        $("select").change(function () {
            parent.SetCitys('<%=FieldName %>', $("#tbProvince").val() + ',' + $("#tbCity").val())
        });
    });
    </script>
</div>    
<div id="four_div" runat="server" class="d-flex flex-wrap" visible="false">
<script src="http://code.z01.com/four.js"></script>
<select id="tbProvince" class="form-control map_w"></select>
<select id="tbCity" class="form-control map_w"></select>
<select id="tbCounty" class="form-control map_w"></select>
<select id="tbSTown" class="form-control map_w"></select>
<script type="text/javascript">
    $(function () {
        var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty", "tbSTown");
        $("#address").val('<%:FValue %>');
        if ($("#address").val() != "") {
            var defdata = $("#address").val().split(',');
            pcc.SetDef(defdata[0], defdata[1], defdata[2], defdata[3]);
        }
        pcc.ProvinceInit();
        $("select").change(function () {
            parent.SetCitys('<%=FieldName %>', $("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val() + ',' + $("#tbSTown").val())
            });
    });
</script>
</div>
<input id="address" runat="server" type="hidden" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <asp:Literal runat="server" ID="CSS_L"></asp:Literal>
   <style>
   body{background: none;}#three_div{padding: 0!important;}
   @media (max-width:768px){}
   </style>
</asp:Content>
