<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="ZoomLaCMS.Design.mobile.pop.list" MasterPageFile="~/Design/Master/MB_POP.master" EnableViewState="false" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>列表修改</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="page-group" ng-app="app">
    <div id="page_list" class="page page-current" ng-controller="APPCtrl">
        <header class="bar bar-nav">
            <a class="button button-link button-nav pull-left back" href="javascript:;" ng-click="save();">
                <span class="icon icon-left"></span>
                返回
            </a>
             <a href="#page_content" class="button button-fill button-nav pull-right" ng-click="new()">添加数据</a>
            <h1 class="title">内容管理</h1>
        </header>
        <div class="content native-scroll">
        <div class="list-block cards-list">
          <ul>
            <li class="card list_item" ng-repeat="item in list track by $index">
              <div class="card-header">
                  <span ng-bind="item.title"></span>
                  <a href="javascript:;" ng-click="del(item.id);" class="button button-fill button-danger"><i class="zi zi_trashalt"></i> 删除</a>
              </div>
              <div class="card-content">
                <div class="card-content-inner">
                    <div class="img_wrap">
                    <span ng-bind-html="getimg(item.wxico)|html"></span>
                </div>
                    <div class="con_wrap">
                        <div><span class="name">背景色：</span><span class="bkval" ng-style="getbk(item.wxbk)"></span></div>
                        <div><span class="name">尺寸：</span><span class="val" ng-bind="item.wxsize"></span></div>
                    </div>
                    <div class="op_wrap" ng-click="edit(item);">
                    <i class="zi zi_pencilalt zi_2x"></i>
                    <div>
                        <span>编辑</span>
                    </div>
                </div>
                </div>
              </div>
         <%--     <div class="card-footer">卡脚</div>--%>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div id="page_content" class="page" ng-controller="ConCtrl">

        <header class="bar bar-nav">
            <a class="button button-link button-nav pull-left back" href="javascript:;" ng-click="cancel();">
                <span class="icon icon-left"></span>
                返回
            </a>
            <h1 class="title">内容管理</h1>
        </header>
         <div class="content">
            <div class="list-block">
                <ul>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">标题</div>
                                <div class="item-input">
                                    <input type="text" placeholder="标题" ng-model="model.title" />
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">链接</div>
                                <div class="item-input">
                                    <input type="text" placeholder="为空则自动生成" ng-model="model.wxlink" />
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">尺寸</div>
                                <div class="item-input">
                                    <select ng-model="model.wxsize">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">图标</div>
                                <div class="item-input" style="position:relative;">
                                    <i class="{{model.wxico}}" style="position:absolute;left:-30px;top:12px;"></i>
                                    <input type="text" placeholder="图标" ng-model="model.wxico" />
                                </div>
                                <a href="#page_icons" class="button button-fill" style="min-width:60px;">选择</a>
                            </div>
                        </div>
                    </li>
                    <li>
                         <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">背景色</div>
                                <div class="item-input">
                                    <input type="text" placeholder="背景色" ng-model="model.wxbk"/>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div ng-repeat="item in colorArr" ng-style="getcolor(item)" ng-click="setcolor(item);" class="colorItem"></div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">数据类型</div>
                                <div class="item-input">
                                    <select ng-model="model.dbtype">
                                        <option value="footbar">底部栏</option>
                                        <option value="image">单图</option>
                                        <option value="list" selected="selected">列表</option>
                                        <option value="nav">轮播图</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </li>
                <%--    <li>
                        <div class="item-content">
                            <div class="item-inner">
                                <div class="item-title label">是否标识</div>
                                <div class="item-input">
                                    <label class="label-switch">
                                        <input type="checkbox" />
                                        <div class="checkbox"></div>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </li>--%>
                    <li onclick="openEditor();">
                         <div class="item-content">
                            <div class="item-inner">
                                 <div class="item-input" id="content_div"></div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="content-block">
                <div class="row">
                    <div class="col-50"><a href="#page_list" ng-click="cancel();" class="button button-big button-fill button-danger back">取消</a></div>
                    <div class="col-50"><a href="#page_list" ng-click="save();" class="button button-big button-fill button-success back">提交</a></div>
                </div>
            </div>
        </div>
    </div>
    <div id="page_icons" class="page">
        <header class="bar bar-nav">
            <a href="#page_content" class="button button-link button-nav pull-left back"><span class="icon icon-left"></span>返回</a>
            <h1 class="title">图标选择</h1>
            <a href="#page_content" class="button button-fill button-success button-nav pull-right back" onclick="icon.set();">确定</a>
        </header>
        <div class="content">
             <div class="row fontawesome-icon-list">
				 <div class="zi_hover"><a><i class="zi zi_glass"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_music"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_search"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_menu"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_service"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_textbook"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_IDcard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_Idcards"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleDonw"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_quiet"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bell"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_verFlag"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_house"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareBook"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareHandCorrect"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareLess"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squarePlus"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareMultiply"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareHandle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareDown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_curve"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleCorrect"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareCorrect"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clock"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_copyright"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circlesNesting"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_compass"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_Cryingface"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_smile"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_steeringWheel"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_Rudder"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleStop"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_smileyFace"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circlePause"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circlePlay"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleQuestion"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleVatar"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_reg"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleCancel"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_footballLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_halfMonth"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_snowflake"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleComponents"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_starLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_starHalf"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_starHalfBlack"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_plusSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bubbleSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_lessSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_listSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_jumpSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_floppyDisk"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_selectFile"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cut"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_floderLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_floderOpen"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_flag"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileNew"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_word"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileEdit"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileZip"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileAudio"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileCode"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileSilent"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_filePic"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_pdf"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_filePrt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileVideo"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_oppose"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_digg"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileBook"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cc"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_creditCard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_envelope"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_oneDollar"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileGraph"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_idCheck"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_maps"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_keyboard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chat"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_copyfile"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_noSee"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_newMsg"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_msgchat"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_openMsg"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_write"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fly"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_paper"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diamond"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bulb"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_idRec"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_hourglass"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_hospital"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_love"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_disk"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_shakeHands"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_hand"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dumb"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_scissors"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fistLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_click"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handup"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handdown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handTwo"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_handRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bulbTorch"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bulbGlow"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bulbLine"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_torch"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_schoolDesk"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_greatWall"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_batteryEmpty"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_battery"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_batteryHalf"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_batteryquarter"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_addressBook"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_addressCard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_adjust"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_aligncenter"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_alignjustify"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_alignleft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_alignright"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_allergies"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_ambulance"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_SignLanguageUSA"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_anchor"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleDown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_pathDown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_pathLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_pathRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_pathUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_archive"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleDownBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleLeftBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleRightBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleUpBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleDownLong"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleLeftLong"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleRightLong"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleUpLong"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_arrowDown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_arrowLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_arrowRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_arrowUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleArrowLandscape"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doubleArrowVertical"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_arrowsalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_assistivelisteningsystems"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_asterisk"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_at"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_audiodescription"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_backward"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_balancescale"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_ban"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bandaid"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_barcode"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bars"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_baseballball"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_basketballball"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bath"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_batterythreequarters"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bed"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_beer"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bellslash"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bells"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bicycle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_binoculars"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_birthdaycake"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_blender"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_blind"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_lightning"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bomb"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bookopen"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_book"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bookmark"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bowlingball"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_boxopen"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_box"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_boxes"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_braille"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_medical"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_briefcase"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_broadcasttower"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_broom"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bug"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_building"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_speaker"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bullseye"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_burn"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_bus"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_calculator"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_calendar"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareHandCorrectB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareLessB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squarePlusB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareMultiplyB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_squareBlod"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cameraretro"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_camera"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_capsules"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_car"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretdown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretleft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretsquaredown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretsquareLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretsquareRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretsquareUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_caretUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cartarrowdown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cartarrowPlus"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_certificate"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chalkboardteacher"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chalkboard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chartarea"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chartbar"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chartline"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chartpie"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_checkcircle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_checksquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_check"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessbishop"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessboard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessking"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessknight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chesspawn"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessqueen"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chessrook"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_chess"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleDowns"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circlelefts"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleRights"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circleUps"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_forDown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_forLeft"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_forRight"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_forUp"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_child"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_church"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circlenotch"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_circle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clipboardcheck"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clipboardlist"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clipboard"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clockCir"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clone"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_closedcaptioning"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clouddownloadalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_clouduploadalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cloud"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_codebranch"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_code"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_coffee"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cog"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cogs"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_coins"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_columns"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_commentalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_commentdots"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_comment"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_commentslash"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_comments"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_compactdisc"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_compassBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_compress"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_copy"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_copyrightBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_couch"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_creditcards"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_crop"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_crosshairs"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_crow"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_crown"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cube"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_crh"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_motoCycle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_SmilLove"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_SquareTable"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cubes"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_cuts"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_database"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_deaf"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_desktop"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diagnoses"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceFive"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceFour"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceOne"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceSix"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceThree"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_diceTwo"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dice"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_divide"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dna"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dollarSign"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dollyFlatbed"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dolly"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_donate"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_doorClosed"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_openClosed"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dotcircle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dove"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_download"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_dumbbell"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_edit"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_eject"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_ellipsish"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_ellipsisv"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_envelopeOpen"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_envelopeSquare"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_envelopeBold"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_equals"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_eraser"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_euroSign"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_exchangealt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_exclamationCircle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_exclamationTriangle"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_exclamation"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_expandarrowsalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_expand"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_externalLinkalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_externalLinksquarealt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_eyeDropper"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_eyeslash"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_eye"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fastBackward"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fastForward"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fax"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_feather"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_female"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fighterjet"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_filealt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileArchiveb"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileAudioB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileCodeB"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileExcel"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileImage"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileMedicalalt"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_fileMedical"></i></a></div>
				 <div class="zi_hover"><a><i class="zi zi_filePDF"></i></a></div>
            </div>
        </div>
    </div>
</div>
<div id="pop_div" class="popup popup-edit">
    <div class="content" id="pop_content">
         
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.list_item .img_wrap {width:80px;padding:10px;text-align:center;display:table-cell;vertical-align:middle;}
.list_item .img_wrap i {font-size:50px;color:#ccc;}
.list_item .img_wrap img {max-width:50px;}
.list_item .con_wrap {display:table-cell;width:65%;}
.list_item .con_wrap > div {height:25px;}
.list_item .con_wrap .name {min-width:80px;text-align:right;display:inline-block;color:#ccc;}
.list_item .con_wrap .bkval {border:1px solid #ddd;width:60px;height:20px;display:inline-block;}
.list_item .op_wrap {text-align:center;display:table-cell;width:80px;vertical-align:middle;color:#999;}
.colorItem {border-radius:50%;display:inline-block;width:30px;height:30px;border:1px solid #ddd;}
.fontawesome-icon-list {padding-left:25px;padding-top:10px;padding-bottom:10px; background-color:#fff;}
.fontawesome-icon-list .fa-hover {float:left;width:24%;margin-right:3px;margin-bottom:10px;text-align:center;border:1px solid #ddd;border-radius:4px;height:50px;padding-top:5px;}
.fontawesome-icon-list .fa-hover i {display:block;font-size:40px;}
.fontawesome-icon-list .text-muted {display:none;}
.fontawesome-icon-list .fa-hover.active {background-color:#0894ec;}
.fontawesome-icon-list .fa-hover.active i {color:#fff;}
#content_div {height:120px;overflow-y:auto;}
#content_div img {max-width:100%;}
</style>
<script>
    //多controller数据共享,同步数据
    //picup.up_before = function () { weui.toast.wait(); }
    var page = { scope: null, backup: "" };//内容scope
    var holder = "点击编辑内容";
    angular.module("app", [])
    .controller("APPCtrl", function ($scope, Data) {
        cfg.firstScope = $scope;
        $scope.list = getlist(cfg.id);
        $scope.getimg = function (url) {
            if (url.indexOf("zi ") > -1) { return '<i class="' + url + '" class="media-object"></i>'; }
            else { return '<img src="' + url + '" class="media-object" />'; }
        }
        $scope.del = function (id) {
            if (!confirm("确定要删除吗")) { return false; }
            for (var i = 0; i < $scope.list.length; i++) {
                top.tools.updatedata("mb_del", { "id": id }, function (data) { console.log(data); });
                if ($scope.list[i].id == id) {
                    $scope.list.splice(i, 1);
                    break;
                }
            }
        }
        //保存列表
        $scope.save = function () {
            //var list = top.tools.clearlist(angular.toJson($scope.list));
            //$.post("/design/update.ashx?action=mb_list", { "list": list }, function (data) { console.log(data); })
            cfg.close();
        }
        //选定编辑某条内容
        $scope.edit = function (item) {
            page.scope.model = item;
            page.backup = angular.toJson(item);
            if (!item.content || item.content == "") { $("#content_div").html(holder); }
            else { $("#content_div").html(item.content); }
            //1,不能直接赋于JSON值,否则无效,
            //2,修改完成后无法实时通知另一个controller
            Zepto.router.load("#page_content");
        }
        $scope.new = function () {
            page.backup = "";
            page.scope.model = { id: "", title: "", wxico: "", wxbk: "#000", wxsize: "1", flag: "", dbtype: "list" };
            $("#content_div").html(holder);
        }
        $scope.getbk = function (color) { return { "background-color": color }; }
    })
    .controller("ConCtrl", function ($scope, Data) {
        page.scope = $scope;
        //$scope.model = Data.model;
        $scope.colorArr = ["#cccccc", "#ff6a00", "#000000", "#fff", "#f6383a", "#b6ff00", "#4cd964", "#35aae7", "#678ce1"];
        $scope.getcolor = function (color) {
            return { "background-color": color }
        }
        $scope.setcolor = function (color) {
            $scope.model.wxbk = color;
        }
        $scope.seticon = function (icon) {
            $scope.model.wxico = icon;
            $scope.$digest();
        }
        //取消修改,还原数据
        $scope.cancel = function () {
            if (page.backup != "") {
                var item = JSON.parse(page.backup);
                $scope.model.title = item.title;
                $scope.model.wxico = item.wxico;
                $scope.model.wxbk = item.wxbk;
                $scope.model.wxsize = item.wxsize;
                $scope.model.flag = item.flag;
                $scope.model.dbtype = item.dbtype;
                page.backup = "";
            }
        }
        //只有新数据才实时提交给后台,否则只要更新model,在关闭时统一提交即可
        $scope.save = function () {
            $("#pop_content").html("");
            $scope.model.content = $("#content_div").html();
            var list = top.tools.clearlist(angular.toJson($scope.model));
            if ($scope.model.id == "") {
                Zepto.showPreloader();
                //提交至后台,并将其加入数组
                top.tools.updatedata("mb_new", { "list": list, type: "" }, function (data) {
                    $scope.model.id = data;
                    cfg.firstScope.list.push($scope.model);
                    cfg.firstScope.$digest();
                    Zepto.hidePreloader();
                })
            }
            else {
                top.tools.updatedata("mb_list", { "list": list }, function (data) { });
                alert("保存成功");
            }
        }
    })
    .factory("Data", function () {
        return {
            model: { id: "", title: "", wxico: "", wxbk: "", wxsize: "", flag: "", dbtype: "" }
        }
    }).filter(
		'html', ['$sce', function ($sce) {
		    return function (text) {
		        return $sce.trustAsHtml(text);
		    }
		}]);
    $(function () {
        $(".fa-hover").click(function () {
            $(".fa-hover").removeClass("active");
            $(this).addClass("active");
        });
    })
    var icon = {};
    icon.set = function () {
        var icon = $(".fa-hover.active").find("i").attr("class");
        page.scope.seticon(icon);
    }
    function openEditor() {
        Zepto.showIndicator();
        $("#pop_content").html("").append('<iframe id="pop_ifr" class="popifr" style="width:100%;height:100%;border:none;"></iframe>');
        $("#pop_ifr").attr("src", "editor.aspx");
        document.getElementById("pop_ifr").onload = function () {
            Zepto.popup('.popup-edit');
            var html = $("#content_div").html();
            if (html != holder) { $("#pop_ifr")[0].contentWindow.settxt(html); }
            else { $("#pop_ifr")[0].contentWindow.settxt(""); }
            Zepto.hideIndicator();
        }
    }
    function closeEditor(content) {
        Zepto.closeModal();
        $("#pop_ifr").remove();
    }
    function saveEditor(content) {
        $("#content_div").html(content);
        setTimeout(function () { closeEditor(); }, 300);//兼容ios
    }
</script>
</asp:Content>