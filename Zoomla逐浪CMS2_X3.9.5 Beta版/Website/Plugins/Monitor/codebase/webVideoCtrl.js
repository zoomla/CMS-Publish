!
function (e) {
    if (!e.WebVideoCtrl) {
        var t = function () {
            function t() {
                this.id = this.createUUID()
            }
            var n = "100%",
                r = "100%",
                o = "",
                i = "",
                a = {
                    szContainerID: "",
                    szColorProperty: "",
                    szOcxClassId: "clsid:FDF0038A-CF64-4634-81AB-80F0A7946D6C",
                    szMimeTypes: "application/webvideo-plugin-kit",
                    iWndowType: 1,
                    iPlayMode: 2,
                    bWndFull: !0,
                    bDebugMode: !1,
                    cbSelWnd: null,
                    cbEvent: null
                },
                u = null,
                c = 0,
                l = [],
                p = [],
                d = null,
                P = null,
                h = null,
                I = null,
                f = this,
                m = null,
                C = 1,
                S = 2,
                y = 200,
                v = 0,
                g = 1,
                x = 2,
                T = 3,
                z = 4,
                D = 5,
                A = 6,
                b = 0,
                M = 2,
                q = 3,
                L = 21,
                R = 0,
                G = "IPCamera",
                X = "IPDome",
                H = "IPZoom",
                w = "<?xml version='1.0' encoding='utf-8'?><FileVersion><Platform name='win32'><npWebVideoKitPlugin.dll>3,0,6,1</npWebVideoKitPlugin.dll><WebVideoKitActiveX.ocx>3,0,6,1</WebVideoKitActiveX.ocx><PlayCtrl.dll>7,3,0,81</PlayCtrl.dll><StreamTransClient.dll>1,1,3,5</StreamTransClient.dll><SystemTransform.dll>2,5,1,7</SystemTransform.dll><NetStream.dll>1,0,5,59</NetStream.dll></Platform></FileVersion>";
            e.GetSelectWndInfo = function (e) {
                var t = I.loadXML(e);
                c = parseInt(s.$XML(t).find("SelectWnd").eq(0).text(), 10), null === m && E();
                var n = [];
                n.push("<RealPlayInfo>"), n.push("<SelectWnd>" + c + "</SelectWnd>"), n.push("</RealPlayInfo>"), a.cbSelWnd && a.cbSelWnd(I.loadXML(n.join("")))
            }, e.ZoomInfoCallback = function (e) {
                var t = f.findWndIndexByIndex(c);
                if (-1 != t) {
                    var s = p[t];
                    if (t = f.findDeviceIndexByIP(s.szIP), -1 != t) {
                        var n = l[t];
                        n.oProtocolInc.set3DZoom(n, s, e, {
                            success: function (e) { },
                            error: function () { }
                        })
                    }
                }
            }, e.PluginEventHandler = function (e, t, s) {
                Z("插件事件：PluginEventHandler iEventType：%s iParam1: %s, iParam2: %s", e, t, s), b == e || M == e ? f.I_Stop(t) : L == e ? f.I_StopRecord(t) : q == e && f.I_StopVoiceTalk(), a.cbEvent && a.cbEvent(e, t, s)
            }, e.GetHttpInfo = function (e, t, s) {
                Z("http响应返回：http状态：%s, http数据：%s", e, t), te.prototype.processCallback(e, t)
            };
            var Z = function () {
                if (a.bDebugMode) {
                    var e = k(arguments);
                    d._alert(e)
                }
            },
                k = function () {
                    for (var e = arguments[0], t = 1; t < arguments.length; t++) e = e.replace("%s", arguments[t]);
                    return e
                },
                W = function (e) {
                    return "undefined" == typeof e
                },
                _ = function () {
                    var e = "";
                    if (I.browser().msie) e = "<object classid='" + a.szOcxClassId + "' codebase='' standby='Waiting...' id='" + o + "' width='" + n + "' height='" + r + "' align='center' ><param name='wndtype' value='" + a.iWndowType + "'><param name='playmode' value='" + a.iPlayMode + "'><param name='colors' value='" + a.szColorProperty + "'></object>";
                    else for (var t = navigator.mimeTypes.length, s = 0; t > s; s++) navigator.mimeTypes[s].type.toLowerCase() == a.szMimeTypes && (e = "<embed align='center' type='" + a.szMimeTypes + "' width='" + n + "' height='" + r + "' name='" + i + "' wndtype='" + a.iWndowType + "' playmode='" + a.iPlayMode + "' colors='" + a.szColorProperty + "'>");
                    return e
                },
                E = function () {
                    var e = u.HWP_GetLocalConfig();//<?xml version="1.0" encoding="utf-8"?><LocalConfigInfo><ProtocolType>0</ProtocolType><StreamType>0</StreamType><PackgeSize>1</PackgeSize><PlayWndType>0</PlayWndType><BuffNumberType>2</BuffNumberType><RecordPath>C:\Users\admin\Web Kit\RecordFiles</RecordPath><CapturePath>C:\Users\admin\Web Kit\CaptureFiles</CapturePath><PlaybackFilePath>C:\Users\admin\Web Kit\PlaybackFiles</PlaybackFilePath><PlaybackPicPath>C:\Users\admin\Web Kit\PlaybackPics</PlaybackPicPath><DownloadPath>C:\Users\admin\Web Kit\DownloadFiles</DownloadPath><SnapScenePicPath>C:\Users\admin\Web Kit\SecenPics</SnapScenePicPath><SnapViewPicPath>C:\Users\admin\Web Kit\ViewPics</SnapViewPicPath><IVSMode>0</IVSMode><RealPlayAll>0</RealPlayAll><CaptureFileFormat>0</CaptureFileFormat><OSDPosInfo>0</OSDPosInfo><SecretKey></SecretKey><RemoteConfigPath>C:\Users\admin\Web Kit\Config</RemoteConfigPath></LocalConfigInfo>
                    m = I.loadXML(e)
                },
                B = function (e) {
                    f.I_GetDeviceInfo(e.szIP, {
                        success: function (t) {
                            e.szDeviceType = s.$XML(t).find("deviceType").eq(0).text()
                        }
                    }), f.I_GetAnalogChannelInfo(e.szIP, {
                        success: function (t) {
                            e.iAnalogChannelNum = s.$XML(t).find("VideoInputChannel", !0).length
                        }
                    }), f.I_GetAudioInfo(e.szIP, {
                        success: function (t) {
                            var n = s.$XML(t).find("audioCompressionType", !0);
                            if (n.length > 0) {
                                var r = s.$XML(n).eq(0).text(),
                                    o = 0;
                                "G.711ulaw" == r ? o = 1 : "G.711alaw" == r ? o = 2 : "G.726" == r && (o = 3), e.iAudioType = o
                            }
                        }
                    })
                },
                N = function () {
                    var e = a.bWndFull ? 1 : 0;
                    u.HWP_SetCanFullScreen(e)
                },
                F = function (e) {
                    var t = -1,
                        s = -1,
                        n = -1,
                        r = null;
                    if (j(e)) r = U(e), t = r.iRtspPort, n = r.iDevicePort;
                    else {
                        for (var o = O(e), i = !1, a = 0; a < o.length; a++) if (o[a].ipv4 == e.szIP || o[a].ipv6 == e.szIP) {
                            i = !0;
                            break
                        }
                        i ? r = U(e) : (r = V(e), -1 == r.iRtspPort && -1 == r.iDevicePort && (r = U(e))), t = r.iRtspPort, s = r.iHttpPort, n = r.iDevicePort
                    }
                    return r
                },
                U = function (e) {
                    var t = -1,
                        n = -1,
                        r = -1;
                    return e.oProtocolInc.getPortInfo(e, {
                        async: !1,
                        success: function (e) {
                            var o = s.$XML(e).find("AdminAccessProtocol", !0);
                            t = 554;
                            for (var i = 0, a = o.length; a > i; i++) "rtsp" === s.$XML(o).eq(i).find("protocol").eq(0).text().toLowerCase() && (t = parseInt(s.$XML(o).eq(i).find("portNo").eq(0).text(), 10)), "http" === s.$XML(o).eq(i).find("protocol").eq(0).text().toLowerCase() && (n = parseInt(s.$XML(o).eq(i).find("portNo").eq(0).text(), 10)), "dev_manage" === s.$XML(o).eq(i).find("protocol").eq(0).text().toLowerCase() && (r = parseInt(s.$XML(o).eq(i).find("portNo").eq(0).text(), 10))
                        },
                        error: function () {
                            t = -1, n = -1, r = -1
                        }
                    }), {
                        iRtspPort: t,
                        iHttpPort: n,
                        iDevicePort: r
                    }
                },
                V = function (e) {
                    var t = -1,
                        n = -1,
                        r = -1;
                    return e.oProtocolInc.getUPnPPortStatus(e, {
                        async: !1,
                        success: function (e) {
                            for (var o = s.$XML(e).find("portStatus", !0), i = 0, a = o.length; a > i; i++) "rtsp" == s.$XML(o).eq(i).find("internalPort").eq(0).text().toLowerCase() && (t = parseInt(s.$XML(o).eq(i).find("externalPort").eq(0).text(), 10)), "http" == s.$XML(o).eq(i).find("internalPort").eq(0).text().toLowerCase() && (n = parseInt(s.$XML(o).eq(i).find("externalPort").eq(0).text(), 10)), "admin" == s.$XML(o).eq(i).find("internalPort").eq(0).text().toLowerCase() && (r = parseInt(s.$XML(o).eq(i).find("externalPort").eq(0).text(), 10))
                        },
                        error: function () {
                            t = -1, n = -1, r = -1
                        }
                    }), {
                        iRtspPort: t,
                        iHttpPort: n,
                        iDevicePort: r
                    }
                },
                O = function (e) {
                    var t = [];
                    return e.oProtocolInc.getNetworkBond(e, {
                        async: !1,
                        success: function (n) {
                            "true" == s.$XML(n).find("enabled").eq(0).text() ? t.push({
                                ipv4: s.$XML(n).find("ipAddress").eq(0).text(),
                                ipv6: s.$XML(n).find("ipv6Address").eq(0).text()
                            }) : e.oProtocolInc.getNetworkInterface(e, {
                                async: !1,
                                success: function (e) {
                                    for (var n = s.$XML(e).find("NetworkInterface", !0), r = 0, o = n.length; o > r; r++) {
                                        t.push({
                                            ipv4: s.$XML(e).find("ipAddress").eq(0).text(),
                                            ipv6: s.$XML(e).find("ipv6Address").eq(0).text()
                                        });
                                        break
                                    }
                                },
                                error: function () { }
                            })
                        },
                        error: function () {
                            e.oProtocolInc.getNetworkInterface(e, {
                                async: !1,
                                success: function (e) {
                                    for (var n = s.$XML(e).find("NetworkInterface", !0), r = 0, o = n.length; o > r; r++) {
                                        t.push({
                                            ipv4: s.$XML(e).find("ipAddress").eq(0).text(),
                                            ipv6: s.$XML(e).find("ipv6Address").eq(0).text()
                                        });
                                        break
                                    }
                                },
                                error: function () { }
                            })
                        }
                    }), t
                },
                j = function (e) {
                    var t = !1;
                    return e.oProtocolInc.getPPPoEStatus(e, {
                        async: !1,
                        success: function (e) {
                            t = s.$XML(e).find("ipAddress", !0).length > 0 ? !0 : s.$XML(e).find("ipv6Address", !0).length > 0
                        },
                        error: function () {
                            t = !1
                        }
                    }), t
                },
                K = function (e) {
                    e.oStreamCapa.bObtained || e.oProtocolInc instanceof se && (G == e.szDeviceType || X == e.szDeviceType || H == e.szDeviceType ? e.oProtocolInc.getStreamChannels(e, {
                        async: !1,
                        success: function (t) {
                            e.oStreamCapa.bObtained = !0;
                            for (var s = $(t).find("streamingTransport", !0).length, n = 0; s > n; n++) if ("shttp" == $(t).find("streamingTransport").eq(n).text().toLowerCase()) {
                                e.oStreamCapa.bObtained = !0, e.oStreamCapa.bSupportShttpPlay = !0, e.oStreamCapa.bSupportShttpPlayback = !0, e.oStreamCapa.bSupportShttpsPlay = !0, e.oStreamCapa.bSupportShttpsPlayback = !0, e.oStreamCapa.iIpChanBase = 1;
                                break
                            }
                        },
                        error: function () { }
                    }) : e.oProtocolInc.getSDKCapa(e, {
                        async: !1,
                        success: function (t) {
                            e.oStreamCapa.bObtained = !0, e.oStreamCapa.bSupportShttpPlay = "true" === s.$XML(t).find("isSupportHttpPlay").eq(0).text(), e.oStreamCapa.bSupportShttpPlayback = "true" === s.$XML(t).find("isSupportHttpPlayback").eq(0).text(), e.oStreamCapa.bSupportShttpsPlay = "true" === s.$XML(t).find("isSupportHttpsPlay").eq(0).text(), e.oStreamCapa.bSupportShttpsPlayback = "true" === s.$XML(t).find("isSupportHttpsPlayback").eq(0).text(), e.oStreamCapa.bSupportShttpPlaybackTransCode = "true" === s.$XML(t).find("isSupportHttpTransCodePlayback").eq(0).text(), e.oStreamCapa.bSupportShttpsPlaybackTransCode = "true" === s.$XML(t).find("isSupportHttpsTransCodePlayback").eq(0).text(), s.$XML(t).find("ipChanBase", !0).length > 0 && (e.oStreamCapa.iIpChanBase = parseInt(s.$XML(t).find("ipChanBase").eq(0).text(), 10))
                        },
                        error: function () {
                            e.oStreamCapa.bObtained = !0
                        }
                    }))
                },
                Y = function (e) {
                    var t = {
                        TransFrameRate: "",
                        TransResolution: "",
                        TransBitrate: ""
                    };
                    if (I.extend(t, e), "" == t.TransFrameRate || "" == t.TransResolution || "" == t.TransBitrate) return "";
                    var s = [];
                    return s.push("<?xml version='1.0' encoding='UTF-8'?>"), s.push("<CompressionInfo>"), s.push("<TransFrameRate>" + t.TransFrameRate + "</TransFrameRate>"), s.push("<TransResolution>" + t.TransResolution + "</TransResolution>"), s.push("<TransBitrate>" + t.TransBitrate + "</TransBitrate>"), s.push("</CompressionInfo>"), s.join("")
                };
            this.I_InitPlugin = function (e, t, s) {
                n = e, r = t, I.extend(a, s)
            }, this.I_InsertOBJECTPlugin = function (t) {
                return W(t) || (a.szContainerID = t), null == document.getElementById(a.szContainerID) ? -1 : null != document.getElementById(o) || 0 != document.getElementsByName(o).length ? -1 : (document.getElementById(a.szContainerID).innerHTML = _(), u = I.browser().msie ? document.getElementById(o) : document.getElementsByName(i)[0], null == u && null == u.object ? -1 : ("object" == typeof e.attachEvent && I.browser().msie && (u.attachEvent("GetSelectWndInfo", GetSelectWndInfo), u.attachEvent("ZoomInfoCallback", ZoomInfoCallback), u.attachEvent("GetHttpInfo", GetHttpInfo), u.attachEvent("PluginEventHandler", PluginEventHandler)), E(), 0))
            }, this.I_WriteOBJECT_XHTML = function () {
                return document.writeln(_()), u = I.browser().msie ? document.getElementById(o) : document.getElementsByName(i)[0], null == u && null == u.object ? -1 : (I.browser().msie && (u.attachEvent("GetSelectWndInfo", GetSelectWndInfo), u.attachEvent("ZoomInfoCallback", ZoomInfoCallback), u.attachEvent("GetHttpInfo", GetHttpInfo), u.attachEvent("PluginEventHandler", PluginEventHandler)), E(), 0)
            }, this.I_OpenFileDlg = function (e) {
                var t = u.HWP_OpenFileBrowser(e, "");
                if (null == t) return "";
                if (1 == e) {
                    if (t.length > 100) return -1
                } else if (t.length > 130) return -1;
                return t
            }, this.I_GetLocalCfg = function () {
                var e = u.HWP_GetLocalConfig(),
                    t = [];
                return m = I.loadXML(e), t.push("<LocalConfigInfo>"), t.push("<ProtocolType>" + s.$XML(m).find("ProtocolType").eq(0).text() + "</ProtocolType>"), t.push("<PackgeSize>" + s.$XML(m).find("PackgeSize").eq(0).text() + "</PackgeSize>"), t.push("<PlayWndType>" + s.$XML(m).find("PlayWndType").eq(0).text() + "</PlayWndType>"), t.push("<BuffNumberType>" + s.$XML(m).find("BuffNumberType").eq(0).text() + "</BuffNumberType>"), t.push("<RecordPath>" + s.$XML(m).find("RecordPath").eq(0).text() + "</RecordPath>"), t.push("<CapturePath>" + s.$XML(m).find("CapturePath").eq(0).text() + "</CapturePath>"), t.push("<PlaybackFilePath>" + s.$XML(m).find("PlaybackFilePath").eq(0).text() + "</PlaybackFilePath>"), t.push("<PlaybackPicPath>" + s.$XML(m).find("PlaybackPicPath").eq(0).text() + "</PlaybackPicPath>"), t.push("<DownloadPath>" + s.$XML(m).find("DownloadPath").eq(0).text() + "</DownloadPath>"), t.push("<IVSMode>" + s.$XML(m).find("IVSMode").eq(0).text() + "</IVSMode>"), t.push("<CaptureFileFormat>" + s.$XML(m).find("CaptureFileFormat").eq(0).text() + "</CaptureFileFormat>"), t.push("</LocalConfigInfo>"), I.loadXML(t.join(""))
            }, this.I_SetLocalCfg = function (e) {
                var t = I.loadXML(e),
                    n = -1;
                return s.$XML(m).find("ProtocolType").eq(0).text(s.$XML(t).find("ProtocolType").eq(0).text()), s.$XML(m).find("PackgeSize").eq(0).text(s.$XML(t).find("PackgeSize").eq(0).text()), s.$XML(m).find("PlayWndType").eq(0).text(s.$XML(t).find("PlayWndType").eq(0).text()), s.$XML(m).find("BuffNumberType").eq(0).text(s.$XML(t).find("BuffNumberType").eq(0).text()), s.$XML(m).find("RecordPath").eq(0).text(s.$XML(t).find("RecordPath").eq(0).text()), s.$XML(m).find("CapturePath").eq(0).text(s.$XML(t).find("CapturePath").eq(0).text()), s.$XML(m).find("PlaybackFilePath").eq(0).text(s.$XML(t).find("PlaybackFilePath").eq(0).text()), s.$XML(m).find("PlaybackPicPath").eq(0).text(s.$XML(t).find("PlaybackPicPath").eq(0).text()), s.$XML(m).find("DownloadPath").eq(0).text(s.$XML(t).find("DownloadPath").eq(0).text()), s.$XML(m).find("IVSMode").eq(0).text(s.$XML(t).find("IVSMode").eq(0).text()), s.$XML(m).find("CaptureFileFormat").eq(0).text(s.$XML(t).find("CaptureFileFormat").eq(0).text()), n = u.HWP_SetLocalConfig(I.toXMLStr(m)), n ? 0 : -1
            };
            //192.168.1.64 1 8000 OmFkbWluOmFkbWluMjAxNQ== 1 [object Object] [object Object]
            //具体登录方法
            var J = function (e, t, s, n, r, o, i) {
                var a = {
                    protocol: t,
                    success: null,
                    error: null
                };
                //console.log(e, t, s, n, r, o, i);
                //alert(e, t, s, n, r, o, i);
                I.extend(a, i), I.extend(a, {
                    success: function (a) {
                        //alert("success");
                        //console.log("success",a);
                        var u = new Q;
                        u.szIP = e, 2 == t ? (u.szHttpProtocol = "https://", u.iHttpsPort = s) : (u.szHttpProtocol = "http://", u.iHttpPort = s), u.iCGIPort = s, u.szAuth = n, u.iDeviceProtocol = r, u.oProtocolInc = o, l.push(u), Z("使用%s协议登录成功", r), B(u), N(), i.success && i.success(a)
                    },
                    error: function (e, t) {
                        //alert("failed");
                        //console.log("error", e,t);
                        i.error && i.error(e, t)
                    }
                }), o.login(e, s, n, a)
            };
            //登录目录设备
            this.I_Login = function (e, t, s, n, r, o) {
                var i = this.findDeviceIndexByIP(e);//-1
                if (-1 != i) return Z("设备已经登录过"), -1;
                var a = P,
                    u = C;//1
                W(o.cgi) || (C == o.cgi ? (a = P, u = C) : (a = h, u = S));
                var c = "";
                //正常登录[flag]
                if (C == u) {
                    c = I.Base64.encode(":" + n + ":" + r);//用户名,密码
                    var l = {
                        success: null,
                        error: null
                    };
                    I.extend(l, o), I.extend(l, {
                        error: function (i, l) {
                            c = I.Base64.encode(n + ":" + r), u = C, a = P;
                            var p = {
                                success: null,
                                error: null
                            };
                            I.extend(p, o), I.extend(p, {
                                error: function () {
                                    if (!W(o.cgi)) return void (o.error && o.error(i, l));
                                    c = I.Base64.encode(":" + n + ":" + r), u = S, a = h;
                                    var p = {
                                        success: null,
                                        error: null
                                    };
                                    I.extend(p, o), I.extend(p, {
                                        error: function (i, l) {
                                            c = I.Base64.encode(n + ":" + r), u = S, a = h;
                                            var p = {
                                                success: null,
                                                error: null
                                            };
                                            I.extend(p, o), I.extend(p, {
                                                error: function () {
                                                    o.error && o.error(i, l)
                                                }
                                            }), J(e, t, s, c, u, a, p)
                                        }
                                    }), J(e, t, s, c, u, a, p)
                                }
                            }), J(e, t, s, c, u, a, p)
                        }
                    }), J(e, t, s, c, u, a, l)
                } else {
                    c = I.Base64.encode(":" + n + ":" + r), u = S, a = h;
                    var l = {
                        success: null,
                        error: null
                    };
                    I.extend(l, o), I.extend(l, {
                        error: function (i, l) {
                            c = I.Base64.encode(n + ":" + r), u = S, a = h;
                            var p = {
                                success: null,
                                error: null
                            };
                            I.extend(p, o), I.extend(p, {
                                error: function () {
                                    o.error && o.error(i, l)
                                }
                            }), J(e, t, s, c, u, a, p)
                        }
                    }), J(e, t, s, c, u, a, l)
                }
            }, this.I_Logout = function (e) {
                var t = this.findDeviceIndexByIP(e);
                return -1 != t ? (l.splice(t, 1), 0) : -1
            }, this.I_GetAudioInfo = function (e, t) {
                var s = this.findDeviceIndexByIP(e);
                if (-1 != s) {
                    var n = l[s],
                        r = {
                            success: null,
                            error: null
                        };
                    I.extend(r, t), n.oProtocolInc.getAudioInfo(n, r)
                }
            }, this.I_GetDeviceInfo = function (e, t) {
                var s = this.findDeviceIndexByIP(e);
                if (-1 != s) {
                    var n = l[s],
                        r = {
                            success: null,
                            error: null
                        };
                    I.extend(r, t), n.oProtocolInc.getDeviceInfo(n, r)
                }
            }, this.I_GetAnalogChannelInfo = function (e, t) {
                var s = this.findDeviceIndexByIP(e);
                if (-1 != s) {
                    var n = l[s],
                        r = {
                            success: null,
                            error: null
                        };
                    I.extend(r, t), n.oProtocolInc.getAnalogChannelInfo(n, r)
                }
            }, this.I_GetDigitalChannelInfo = function (e, t) {
                var s = this.findDeviceIndexByIP(e);
                if (-1 != s) {
                    var n = l[s],
                        r = {
                            success: null,
                            error: null
                        };
                    I.extend(r, t), n.oProtocolInc.getDigitalChannelInfo(n, r)
                }
            }, this.I_GetZeroChannelInfo = function (e, t) {
                var s = this.findDeviceIndexByIP(e);
                if (-1 != s) {
                    var n = l[s],
                        r = {
                            success: null,
                            error: null
                        };
                    I.extend(r, t), n.oProtocolInc.getZeroChannelInfo(n, r)
                }
            }, this.I_StartRealPlay = function (e, t) {
                var n = this.findDeviceIndexByIP(e),
                    r = -1,
                    o = "",
                    i = "",
                    a = -1,
                    u = 0,
                    d = 0,
                    P = !1,
                    h = {
                        iWndIndex: c,
                        iStreamType: 1,
                        iChannelID: 1,
                        bZeroChannel: !1
                    };
                if (I.extend(h, t), -1 != n) {
                    K(l[n]);
                    var f = l[n],
                        C = parseInt(s.$XML(m).find("ProtocolType").eq(0).text(), 10);
                    if (C == R && f.oStreamCapa.bSupportShttpPlay ? (Z("SHTTP RealPlay"), o = f.oProtocolInc.CGI.startShttpRealPlay, i = "http://", d = h.iStreamType - 1, u = h.iChannelID <= f.iAnalogChannelNum ? h.iChannelID : f.oStreamCapa.iIpChanBase + parseInt(h.iChannelID, 10) - f.iAnalogChannelNum - 1, P = !0, W(h.iPort) ? "https://" == f.szHttpProtocol ? (-1 == f.iHttpPort && (f.iHttpPort = F(f).iHttpPort), a = f.iHttpPort) : a = f.iCGIPort : (f.iHttpPort = h.iPort, a = h.iPort)) : (Z("RTSP RealPlay"), o = f.oProtocolInc.CGI.startRealPlay, i = "rtsp://", d = h.iStreamType, u = h.iChannelID, W(h.iPort) || (f.iRtspPort = h.iPort), -1 == f.iRtspPort && (f.iRtspPort = F(f).iRtspPort), a = f.iRtspPort), -1 == a) return Z("获取端口号失败"), r;
                    if (I.extend(h, {
                        urlProtocol: i,
                        cgi: o,
                        iPort: a,
                        iStreamType: d,
                        iChannelID: u
                    }), n = this.findWndIndexByIndex(h.iWndIndex), -1 == n && (r = f.oProtocolInc.startRealPlay(f, h)), -1 == r) f.iRtspPort = -1;
                    else {
                        n = this.findWndIndexByIndex(h.iWndIndex);
                        var S = p[n];
                        S.bShttpIPChannel = P
                    }
                }
                return r
            }, this.I_Stop = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.bRecord && u.HWP_StopSave(n.iIndex), n.bSound && u.HWP_CloseSound(), n.bEZoom && u.HWP_DisableZoom(n.iIndex), s = u.HWP_Stop(e), 0 == s && p.splice(t, 1)
                }
                return s
            }, this.I_OpenSound = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.bSound || (s = u.HWP_OpenSound(e), 0 == s && (n.bSound = !0))
                }
                return s
            }, this.I_CloseSound = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.bSound && (s = u.HWP_CloseSound(), 0 == s && (n.bSound = !1))
                }
                return s
            }, this.I_SetVolume = function (e, t) {
                var s = -1;
                if (isNaN(parseInt(e, 10))) return s;
                t = W(t) ? c : t;
                var n = this.findWndIndexByIndex(t);
                return -1 != n && (s = u.HWP_SetVolume(t, e)), s
            }, this.I_CapturePic = function (e, t) {
                t = W(t) ? c : t;
                var s = this.findWndIndexByIndex(t),
                    n = -1;
                return -1 != s && (n = u.HWP_CapturePicture(t, e)), n
            }, this.I_StartRecord = function (e, t) {
                t = W(t) ? c : t;
                var s = this.findWndIndexByIndex(t),
                    n = -1;
                if (-1 != s) {
                    var r = p[s];
                    r.bRecord || (n = u.HWP_StartSave(t, e), 0 == n && (r.bRecord = !0))
                }
                return n
            }, this.I_StopRecord = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.bRecord && (s = u.HWP_StopSave(e), 0 == s && (n.bRecord = !1))
                }
                return s
            }, this.I_StartVoiceTalk = function (e, t) {
                if (isNaN(parseInt(t, 10))) return -1;
                var s = this.findDeviceIndexByIP(e),
                    n = -1;
                if (-1 != s) {
                    var r = l[s];
                    r.bVoiceTalk || (n = r.oProtocolInc.startVoiceTalk(r, t), 0 == n && (l[s].bVoiceTalk = !0))
                }
                return n
            }, this.I_StopVoiceTalk = function () {
                for (var e = u.HWP_StopVoiceTalk(), t = 0, s = l.length; s > t; t++) if (l[t].bVoiceTalk) {
                    l[t].bVoiceTalk = !1;
                    break
                }
                return e
            }, this.I_PTZControl = function (e, t, s) {
                var n = {
                    iWndIndex: c,
                    iPTZIndex: e,
                    iPTZSpeed: 4
                };
                I.extend(n, s), I.extend(n, {
                    async: !1
                });
                var r = this.findWndIndexByIndex(n.iWndIndex);
                if (-1 != r) {
                    var o = p[r];
                    if (r = this.findDeviceIndexByIP(o.szIP), -1 != r) {
                        var i = l[r];
                        9 == e ? i.oProtocolInc.ptzAutoControl(i, t, o, n) : i.oProtocolInc.ptzControl(i, t, o, n)
                    }
                }
            }, this.I_EnableEZoom = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.bEZoom || (s = u.HWP_EnableZoom(e, 0), 0 == s && (n.bEZoom = !0))
                }
                return s
            }, this.I_DisableEZoom = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    if (n.bEZoom) return u.HWP_DisableZoom(e), n.bEZoom = !1, 0
                }
                return s
            }, this.I_Enable3DZoom = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.b3DZoom || (s = u.HWP_EnableZoom(e, 1), 0 == s && (n.b3DZoom = !0))
                }
                return s
            }, this.I_Disable3DZoom = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    if (n.b3DZoom) return u.HWP_DisableZoom(e), n.b3DZoom = !1, 0
                }
                return s
            }, this.I_FullScreen = function (e) {
                u.HWP_FullScreenDisplay(e)
            }, this.I_SetPreset = function (e, t) {
                var s = {
                    iWndIndex: c,
                    iPresetID: e
                };
                I.extend(s, t);
                var n = this.findWndIndexByIndex(s.iWndIndex);
                if (-1 != n) {
                    var r = p[n];
                    if (n = this.findDeviceIndexByIP(r.szIP), -1 != n) {
                        var o = l[n];
                        o.oProtocolInc.setPreset(o, r, s)
                    }
                }
            }, this.I_GoPreset = function (e, t) {
                var s = {
                    iWndIndex: c,
                    iPresetID: e
                };
                I.extend(s, t);
                var n = this.findWndIndexByIndex(s.iWndIndex);
                if (-1 != n) {
                    var r = p[n];
                    if (n = this.findDeviceIndexByIP(r.szIP), -1 != n) {
                        var o = l[n];
                        o.oProtocolInc.goPreset(o, r, s)
                    }
                }
            }, this.I_RecordSearch = function (e, t, s, n, r) {
                var o = this.findDeviceIndexByIP(e);
                if (-1 != o) {
                    var i = l[o],
                        a = {
                            iChannelID: t,
                            szStartTime: s,
                            szEndTime: n,
                            iSearchPos: 0,
                            success: null,
                            error: null
                        };
                    I.extend(a, r), i.oProtocolInc.recordSearch(i, a)
                }
            }, this.I_StartPlayback = function (e, t) {
                var n = this.findDeviceIndexByIP(e),
                    r = -1,
                    o = "",
                    i = "",
                    a = -1,
                    u = 1,
                    p = I.dateFormat(new Date, "yyyy-MM-dd"),
                    d = {
                        iWndIndex: c,
                        iChannelID: 1,
                        szStartTime: p + " 00:00:00",
                        szEndTime: p + " 23:59:59"
                    };
                if (I.extend(d, t), -1 != n) {
                    K(l[n]);
                    var P = l[n],
                        h = parseInt(s.$XML(m).find("ProtocolType").eq(0).text(), 10);
                    if (h == R && P.oStreamCapa.bSupportShttpPlay ? (o = W(d.oTransCodeParam) ? P.oProtocolInc.CGI.startShttpPlayback : P.oProtocolInc.CGI.startTransCodePlayback, i = "http://", u = d.iChannelID <= P.iAnalogChannelNum ? d.iChannelID : P.oStreamCapa.iIpChanBase + parseInt(d.iChannelID, 10) - P.iAnalogChannelNum - 1, W(d.iPort) ? "https://" == P.szHttpProtocol ? (-1 == P.iHttpPort && (P.iHttpPort = F(P).iHttpPort), a = P.iHttpPort) : a = P.iCGIPort : (P.iHttpPort = d.iPort, a = d.iPort)) : (o = P.oProtocolInc.CGI.startPlayback, i = "rtsp://", u = 100 * d.iChannelID + 1, W(d.iPort) || (P.iRtspPort = d.iPort), -1 == P.iRtspPort && (P.iRtspPort = F(P).iRtspPort), a = P.iRtspPort), -1 == a) return Z("获取端口号失败"), r;
                    I.extend(d, {
                        urlProtocol: i,
                        cgi: o,
                        iPort: a,
                        iChannelID: u
                    }), n = this.findWndIndexByIndex(d.iWndIndex), -1 == n && (d.szStartTime = d.szStartTime.replace(/[-:]/g, "").replace(" ", "T") + "Z", d.szEndTime = d.szEndTime.replace(/[-:]/g, "").replace(" ", "T") + "Z", r = P.oProtocolInc.startPlayback(P, d)), -1 == r && (P.iRtspPort = -1)
                }
                return r
            }, this.I_ReversePlayback = function (e, t) {
                var n = this.findDeviceIndexByIP(e),
                    r = -1,
                    o = "",
                    i = "",
                    a = -1,
                    u = -1,
                    p = I.dateFormat(new Date, "yyyy-MM-dd"),
                    d = {
                        iWndIndex: c,
                        iChannelID: 1,
                        bZeroChannel: !1,
                        szStartTime: p + " 00:00:00",
                        szEndTime: p + " 23:59:59"
                    };
                if (I.extend(d, t), -1 != n) {
                    K(l[n]);
                    var P = l[n],
                        h = parseInt(s.$XML(m).find("ProtocolType").eq(0).text(), 10);
                    if (h == R && P.oStreamCapa.bSupportShttpPlay ? (o = P.oProtocolInc.CGI.startShttpReversePlayback, i = "http://", u = d.iChannelID <= P.iAnalogChannelNum ? d.iChannelID : P.oStreamCapa.iIpChanBase + parseInt(d.iChannelID, 10) - P.iAnalogChannelNum - 1, W(d.iPort) ? "https://" == P.szHttpProtocol ? (-1 == P.iHttpPort && (P.iHttpPort = F(P).iHttpPort), a = P.iHttpPort) : a = P.iCGIPort : (P.iHttpPort = d.iPort, a = d.iPort)) : (o = P.oProtocolInc.CGI.startPlayback, i = "rtsp://", u = 100 * d.iChannelID + 1, W(d.iPort) || (P.iRtspPort = d.iPort), -1 == P.iRtspPort && (P.iRtspPort = F(P).iRtspPort), a = P.iRtspPort), -1 == a) return Z("获取端口号失败"), r;
                    I.extend(d, {
                        urlProtocol: i,
                        cgi: o,
                        iPort: a,
                        iChannelID: u
                    }), n = this.findWndIndexByIndex(d.iWndIndex), -1 == n && (d.szStartTime = d.szStartTime.replace(/[-:]/g, "").replace(" ", "T") + "Z", d.szEndTime = d.szEndTime.replace(/[-:]/g, "").replace(" ", "T") + "Z", r = P.oProtocolInc.reversePlayback(P, d))
                }
                return -1 == r && (P.iRtspPort = -1), r
            }, this.I_Frame = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t],
                        r = n.iPlayStatus;
                    r != x && r != z || (s = u.HWP_FrameForward(e), 0 == s && (n.iPlayStatus = z))
                }
                return s
            }, this.I_Pause = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t],
                        r = n.iPlayStatus;
                    r == x ? (s = u.HWP_Pause(e), 0 == s && (n.iPlayStatus = T)) : r == D && (s = u.HWP_Pause(e), 0 == s && (n.iPlayStatus = A))
                }
                return s
            }, this.I_Resume = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t],
                        r = n.iPlayStatus;
                    r == T || r == z ? (s = u.HWP_Resume(e), 0 == s && (n.iPlayStatus = x)) : r == A && (s = u.HWP_Resume(e), 0 == s && (n.iPlayStatus = D))
                }
                return s
            }, this.I_PlaySlow = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.iPlayStatus == x && (s = u.HWP_Slow(e))
                }
                return s
            }, this.I_PlayFast = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = p[t];
                    n.iPlayStatus == x && (s = u.HWP_Fast(e))
                }
                return s
            }, this.I_GetOSDTime = function (e) {
                e = W(e) ? c : e;
                var t = this.findWndIndexByIndex(e),
                    s = -1;
                if (-1 != t) {
                    var n = u.HWP_GetOSDTime(e);
                    return I.dateFormat(new Date(1e3 * n), "yyyy-MM-dd hh:mm:ss")
                }
                return s
            }, this.I_StartDownloadRecord = function (e, t, s) {
                var n = this.findDeviceIndexByIP(e),
                    r = -1;
                if (-1 != n) {
                    var o = l[n],
                        i = {
                            szPlaybackURI: t,
                            szFileName: s
                        };
                    r = o.oProtocolInc.startDownloadRecord(o, i)
                }
                return r
            }, this.I_GetDownloadStatus = function (e) {
                var t = u.HWP_GetDownloadStatus(e);
                return 1 == t && (t = -1), t
            }, this.I_GetDownloadProgress = function (e) {
                return u.HWP_GetDownloadProgress(e)
            }, this.I_StopDownloadRecord = function (e) {
                return u.HWP_StopDownload(e)
            }, this.I_ExportDeviceConfig = function (e) {
                var t = this.findDeviceIndexByIP(e),
                    s = -1;
                if (-1 != t) {
                    var n = l[t];
                    s = n.oProtocolInc.exportDeviceConfig(n)
                }
                return s
            }, this.I_ImportDeviceConfig = function (e, t) {
                var s = this.findDeviceIndexByIP(e),
                    n = -1;
                if (-1 != s) {
                    var r = l[s],
                        o = {
                            szFileName: t
                        };
                    n = r.oProtocolInc.importDeviceConfig(r, o)
                }
                return n
            }, this.I_RestoreDefault = function (e, t, s) {
                var n = {
                    success: null,
                    error: null
                };
                I.extend(n, s);
                var r = this.findDeviceIndexByIP(e);
                if (-1 != r) {
                    var o = l[r];
                    o.oProtocolInc.restore(o, t, n)
                }
            }, this.I_Restart = function (e, t) {
                var s = this.findDeviceIndexByIP(e),
                    n = {
                        success: null,
                        error: null
                    };
                if (I.extend(n, t), -1 != s) {
                    var r = l[s];
                    r.oProtocolInc.restart(r, n)
                }
            }, this.I_Reconnect = function (e, t) {
                var s = this.findDeviceIndexByIP(e),
                    n = {
                        success: null,
                        error: null
                    };
                if (I.extend(n, t), -1 != s) {
                    var r = l[s];
                    r.oProtocolInc.login(r.szIP, r.iCGIPort, r.szAuth, n)
                }
            }, this.I_StartUpgrade = function (e, t) {
                var s = this.findDeviceIndexByIP(e),
                    n = -1;
                if (-1 != s) {
                    var r = l[s],
                        o = {
                            szFileName: t
                        };
                    n = r.oProtocolInc.startUpgrade(r, o)
                }
                return n
            }, this.I_UpgradeStatus = function () {
                return u.HWP_UpgradeStatus()
            }, this.I_UpgradeProgress = function () {
                return u.HWP_UpgradeProgress()
            }, this.I_StopUpgrade = function () {
                return u.HWP_StopUpgrade()
            }, this.I_CheckPluginInstall = function () {
                var e = -1,
                    t = I.browser();
                if (t.chrome && parseInt(t.version, 10) > 45) return -2;
                if (t.msie) try {
                    new ActiveXObject("WebVideoKitActiveX.WebVideoKitActiveXCtrl.1");
                    e = 0
                } catch (s) { } else for (var n = 0, r = navigator.mimeTypes.length; r > n; n++) if ("application/webvideo-plugin-kit" == navigator.mimeTypes[n].type.toLowerCase()) {
                    e = 0;
                    break
                }
                return e
            }, this.I_CheckPluginVersion = function () {
                return u.HWP_CheckPluginUpdate(w) ? -1 : 0
            }, this.I_SendHTTPRequest = function (e, t, s) {
                var n = this.findDeviceIndexByIP(e);
                if (!(0 > n)) {
                    var r = l[n],
                        o = new te,
                        i = r.szHttpProtocol + r.szIP + ":" + r.iCGIPort + "/" + t,
                        a = {
                            type: "GET",
                            url: i,
                            auth: r.szAuth,
                            success: null,
                            error: null
                        };
                    I.extend(a, s), I.extend(a, {
                        success: function (e) {
                            s.success && s.success(e)
                        },
                        error: function (e, t) {
                            s.error && s.error(e, t)
                        }
                    }), o.setRequestParam(a), o.submitRequest()
                }
            }, this.I_RemoteConfig = function (e, t) {
                var s = this.findDeviceIndexByIP(e),
                    n = -1,
                    r = -1,
                    o = {
                        iLan: 0,
                        iDevicePort: -1,
                        iType: 0
                    };
                if (I.extend(o, t), -1 != s) {
                    var i = l[s];
                    if (-1 == o.iDevicePort) if (-1 == i.iDevicePort) {
                        if (i.iDevicePort = F(i).iDevicePort, r = i.iDevicePort, -1 == r) return n
                    } else r = i.iDevicePort;
                    else r = o.iDevicePort;
                    if (":" == I.Base64.decode(i.szAuth)[0]) var a = I.Base64.decode(i.szAuth).split(":")[1],
                        c = I.Base64.decode(i.szAuth).split(":")[2];
                    else var a = I.Base64.decode(i.szAuth).split(":")[0],
                        c = I.Base64.decode(i.szAuth).split(":")[1];
                    var p = "<RemoteInfo><DeviceInfo><DeviceType>" + o.iType + "</DeviceType><LanType>" + o.iLan + "</LanType><IP>" + e + "</IP><Port>" + r + "</Port><UName>" + a + "</UName><PWD>" + I.Base64.encode(c) + "</PWD></DeviceInfo></RemoteInfo>";
                    return u.HWP_ShowRemConfig(p)
                }
                return n
            }, this.I_ChangeWndNum = function (e) {
                return isNaN(parseInt(e, 10)) ? -1 : (u.HWP_ArrangeWindow(e), 0)
            }, this.I_GetLastError = function () {
                return u.HWP_GetLastError()
            }, this.I_GetWindowStatus = function (e) {
                if (W(e)) {
                    var t = [];
                    return I.extend(t, p), t
                }
                var s = this.findWndIndexByIndex(e);
                if (-1 != s) {
                    var t = {};
                    return I.extend(t, p[s]), t
                }
                return null
            }, this.I_GetIPInfoByMode = function (e, t, s, n) {
                return u.HWP_GetIpInfoByMode(e, t, s, n)
            }, this.findDeviceIndexByIP = function (e) {
                for (var t = 0; t < l.length; t++) if (l[t].szIP == e) return t;
                return -1
            }, this.findWndIndexByIndex = function (e) {
                for (var t = 0; t < p.length; t++) if (p[t].iIndex == e) return t;
                return -1
            };
            var Q = function () {
                this.szIP = "", this.szHostName = "", this.szAuth = "", this.szHttpProtocol = "http://", this.iCGIPort = 80, this.iDevicePort = -1, this.iHttpPort = -1, this.iHttpsPort = -1, this.iRtspPort = -1, this.iAudioType = 1, this.iDeviceProtocol = C, this.oProtocolInc = null, this.iAnalogChannelNum = 0, this.szDeviceType = "", this.bVoiceTalk = !1, this.oStreamCapa = {
                    bObtained: !1,
                    bSupportShttpPlay: !1,
                    bSupportShttpPlayback: !1,
                    bSupportShttpsPlay: !1,
                    bSupportShttpsPlayback: !1,
                    bSupportShttpPlaybackTransCode: !1,
                    bSupportShttpsPlaybackTransCode: !1,
                    iIpChanBase: 1
                }
            },
                ee = function () {
                    this.iIndex = 0, this.szIP = "", this.iChannelID = "", this.iPlayStatus = v, this.bSound = !1, this.bRecord = !1, this.bPTZAuto = !1, this.bEZoom = !1, this.b3DZoom = !1
                },
                te = function () {
                    this.options = {
                        type: "GET",
                        url: "",
                        auth: "",
                        timeout: 1e4,
                        data: "",
                        async: !0,
                        success: null,
                        error: null
                    }, this.m_szHttpHead = "", this.m_szHttpContent = "", this.m_szHttpData = ""
                };
            te.prototype.m_httpRequestSet = [], te.prototype.setRequestParam = function (e) {
                I.extend(this.options, e)
            }, te.prototype.submitRequest = function () {
                var e = this.getHttpMethod(this.options.type),
                    t = null;
                if (this.options.async) {
                    var s = u.HWP_SubmitHttpRequest(e, this.options.url, this.options.auth, this.options.data, this.options.timeout); -1 != s && (t = {
                        iRequestID: s,
                        funSuccessCallback: this.options.success,
                        funErrorCallback: this.options.error
                    }, this.m_httpRequestSet.push(t))
                } else {
                    var n = u.HWP_SendHttpSynRequest(e, this.options.url, this.options.auth, this.options.data, this.options.timeout);
                    t = {
                        funSuccessCallback: this.options.success,
                        funErrorCallback: this.options.error
                    }, this.httpDataAnalyse(t, n)
                }
            }, te.prototype.getHttpMethod = function (e) {
                var t = {
                    GET: 1,
                    POST: 2,
                    PUT: 5,
                    DELETE: 6
                },
                    s = t[e];
                return s ? s : -1
            }, te.prototype.processCallback = function (e, t) {
                for (var s = null, n = 0; n < this.m_httpRequestSet.length; n++) if (e == this.m_httpRequestSet[n].iRequestID) {
                    s = this.m_httpRequestSet[n], this.m_httpRequestSet.splice(n, 1);
                    break
                }
                null != s && (this.httpDataAnalyse(s, t), delete s)
            }, te.prototype.httpDataAnalyse = function (e, t) {
                var s = "",
                    n = 0;
                "" == t || W(t) ? e.funErrorCallback() : (n = parseInt(t.substring(0, 3)), s = t.substring(3, t.length), isNaN(n) ? e.funErrorCallback() : y == n ? e.funSuccessCallback(I.loadXML(s)) : e.funErrorCallback(n, I.loadXML(s)))
            };
            var se = function () { };
            se.prototype.CGI = {
                login: "%s%s:%s/ISAPI/Security/userCheck",
                getAudioInfo: "%s%s:%s/ISAPI/System/TwoWayAudio/channels",
                getDeviceInfo: "%s%s:%s/ISAPI/System/deviceInfo",
                getAnalogChannelInfo: "%s%s:%s/ISAPI/System/Video/inputs/channels",
                getDigitalChannel: "%s%s:%s/ISAPI/ContentMgmt/InputProxy/channels",
                getDigitalChannelInfo: "%s%s:%s/ISAPI/ContentMgmt/InputProxy/channels/status",
                getZeroChannelInfo: "%s%s:%s/ISAPI/ContentMgmt/ZeroVideo/channels",
                getStreamChannels: {
                    analog: "%s%s:%s/ISAPI/Streaming/channels",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/StreamingProxy/channels"
                },
                getStreamDynChannels: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/DynStreaming/channels",
                startRealPlay: {
                    channels: "%s%s:%s/PSIA/streaming/channels/%s",
                    zeroChannels: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/ZeroStreaming/channels/%s"
                },
                startShttpRealPlay: {
                    channels: "%s%s:%s/SDK/play/%s/004",
                    zeroChannels: "%s%s:%s/SDK/play/100/004/ZeroStreaming"
                },
                startVoiceTalk: {
                    open: "%s%s:%s/ISAPI/System/TwoWayAudio/channels/%s/open",
                    close: "%s%s:%s/ISAPI/System/TwoWayAudio/channels/%s/close",
                    audioData: "%s%s:%s/ISAPI/System/TwoWayAudio/channels/%s/audioData"
                },
                ptzControl: {
                    analog: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/continuous",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/PTZCtrlProxy/channels/%s/continuous"
                },
                ptzAutoControl: {
                    ipdome: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/presets/%s/goto",
                    analog: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/autoPan",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/PTZCtrlProxy/channels/%s/autoPan"
                },
                setPreset: {
                    analog: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/presets/%s",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/PTZCtrlProxy/channels/%s/presets/%s"
                },
                goPreset: {
                    analog: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/presets/%s/goto",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/PTZCtrlProxy/channels/%s/presets/%s/goto"
                },
                ptzFocus: {
                    analog: "%s%s:%s/ISAPI/Image/channels/%s/focus",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/ImageProxy/channels/%s/focus",
                    ipc: "%s%s:%s/ISAPI/System/Video/inputs/channels/%s/focus"
                },
                ptzIris: {
                    analog: "%s%s:%s/ISAPI/Image/channels/%s/iris",
                    digital: "%s%s:%s/ISAPI/ContentMgmt/ImageProxy/channels/%s/iris",
                    ipc: "%s%s:%s/ISAPI/System/Video/inputs/channels/%s/iris"
                },
                getNetworkBond: "%s%s:%s/ISAPI/System/Network/Bond",
                getNetworkInterface: "%s%s:%s/ISAPI/System/Network/interfaces",
                getUPnPPortStatus: "%s%s:%s/ISAPI/System/Network/UPnP/ports/status",
                getPPPoEStatus: "%s%s:%s/ISAPI/System/Network/PPPoE/1/status",
                getPortInfo: "%s%s:%s/ISAPI/Security/adminAccesses",
                recordSearch: "%s%s:%s/ISAPI/ContentMgmt/search",
                startPlayback: "%s%s:%s/PSIA/streaming/tracks/%s?starttime=%s&endtime=%s",
                startShttpPlayback: "%s%s:%s/SDK/playback/%s",
                startShttpReversePlayback: "%s%s:%s/SDK/playback/%s/reversePlay",
                startTransCodePlayback: "%s%s:%s/SDK/playback/%s/transcoding",
                startDownloadRecord: "%s%s:%s/ISAPI/ContentMgmt/download",
                deviceConfig: "%s%s:%s/ISAPI/System/configurationData",
                restart: "%s%s:%s/ISAPI/System/reboot",
                restore: "%s%s:%s/ISAPI/System/factoryReset?mode=%s",
                startUpgrade: {
                    upgrade: "%s%s:%s/ISAPI/System/updateFirmware",
                    status: "%s%s:%s/ISAPI/System/upgradeStatus"
                },
                set3DZoom: "%s%s:%s/ISAPI/PTZCtrl/channels/%s/position3D",
                SDKCapabilities: "%s%s:%s/SDK/capabilities"
            }, se.prototype.login = function (e, t, n, r) {
                var o = 2 == r.protocol ? "https://" : "http://",
                    i = k(this.CGI.login, o, e, t),
                    a = new te,
                    u = {
                        type: "GET",
                        url: i,
                        auth: n,
                        success: null,
                        error: null
                    };
                I.extend(u, r), I.extend(u, {
                    success: function (e) {
                        "200" == s.$XML(e).find("statusValue").eq(0).text() || "OK" == s.$XML(e).find("statusString").eq(0).text() ? r.success && r.success(e) : r.error && r.error(401, e)
                    },
                    error: function (e, t) {
                        r.error && r.error(e, t)
                    }
                }), a.setRequestParam(u), a.submitRequest()
            }, se.prototype.getAudioInfo = function (e, t) {
                var s = k(this.CGI.getAudioInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getDeviceInfo = function (e, t) {
                var n = k(this.CGI.getDeviceInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<DeviceInfo>"), n.push("<deviceName>" + I.escape(s.$XML(e).find("deviceName").eq(0).text()) + "</deviceName>"), n.push("<deviceID>" + s.$XML(e).find("deviceID").eq(0).text() + "</deviceID>"), n.push("<deviceType>" + s.$XML(e).find("deviceType").eq(0).text() + "</deviceType>"), n.push("<model>" + s.$XML(e).find("model").eq(0).text() + "</model>"), n.push("<serialNumber>" + s.$XML(e).find("serialNumber").eq(0).text() + "</serialNumber>"), n.push("<macAddress>" + s.$XML(e).find("macAddress").eq(0).text() + "</macAddress>"), n.push("<firmwareVersion>" + s.$XML(e).find("firmwareVersion").eq(0).text() + "</firmwareVersion>"), n.push("<firmwareReleasedDate>" + s.$XML(e).find("firmwareReleasedDate").eq(0).text() + "</firmwareReleasedDate>"), n.push("<encoderVersion>" + s.$XML(e).find("encoderVersion").eq(0).text() + "</encoderVersion>"), n.push("<encoderReleasedDate>" + s.$XML(e).find("encoderReleasedDate").eq(0).text() + "</encoderReleasedDate>"), n.push("</DeviceInfo>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, se.prototype.getAnalogChannelInfo = function (e, t) {
                var n = k(this.CGI.getAnalogChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<VideoInputChannelList>");
                        for (var r = s.$XML(e).find("VideoInputChannel", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            n.push("<VideoInputChannel>"), n.push("<id>" + s.$XML(a).find("id").eq(0).text() + "</id>"), n.push("<inputPort>" + s.$XML(a).find("inputPort").eq(0).text() + "</inputPort>"), n.push("<name>" + I.escape(s.$XML(a).find("name").eq(0).text()) + "</name>"), n.push("<videoFormat>" + s.$XML(a).find("videoFormat").eq(0).text() + "</videoFormat>"), n.push("</VideoInputChannel>")
                        }
                        n.push("</VideoInputChannelList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, se.prototype.getDigitalChannel = function (e, t) {
                var n = k(this.CGI.getDigitalChannel, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<InputProxyChannelList>");
                        for (var r = s.$XML(e).find("InputProxyChannel", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            n.push("<InputProxyChannel>"), n.push("<id>" + s.$XML(a).find("id").eq(0).text() + "</id>"), n.push("<name>" + I.escape(s.$XML(a).find("name").eq(0).text()) + "</name>"), n.push("</InputProxyChannel>")
                        }
                        n.push("</InputProxyChannelList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, se.prototype.getDigitalChannelInfo = function (e, t) {
                var n = null,
                    r = {};
                if (this.getDigitalChannel(e, {
                    async: !1,
                    success: function (e) {
                        n = e;
                        for (var t = s.$XML(n).find("InputProxyChannel", !0), o = 0, i = t.length; i > o; o++) {
                            var a = t[o],
                                u = s.$XML(a).find("id").eq(0).text(),
                                c = s.$XML(a).find("name").eq(0).text();
                            r[u] = c
                }
                },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                }
                }), null !== n) {
                    var o = k(this.CGI.getDigitalChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                        i = new te,
                        a = {
                            type: "GET",
                            url: o,
                            auth: e.szAuth,
                            success: null,
                            error: null
                        };
                    I.extend(a, t), I.extend(a, {
                        success: function (e) {
                            var n = [];
                            n.push("<InputProxyChannelStatusList>");
                            for (var o = s.$XML(e).find("InputProxyChannelStatus", !0), i = 0, a = o.length; a > i; i++) {
                                var u = o[i],
                                    c = s.$XML(u).find("id").eq(0).text();
                                n.push("<InputProxyChannelStatus>"), n.push("<id>" + c + "</id>"), n.push("<sourceInputPortDescriptor>"), n.push("<proxyProtocol>" + s.$XML(u).find("proxyProtocol").eq(0).text() + "</proxyProtocol>"), n.push("<addressingFormatType>" + s.$XML(u).find("addressingFormatType").eq(0).text() + "</addressingFormatType>"), n.push("<ipAddress>" + s.$XML(u).find("ipAddress").eq(0).text() + "</ipAddress>"), n.push("<managePortNo>" + s.$XML(u).find("managePortNo").eq(0).text() + "</managePortNo>"), n.push("<srcInputPort>" + s.$XML(u).find("srcInputPort").eq(0).text() + "</srcInputPort>"), n.push("<userName>" + I.escape(s.$XML(u).find("userName").eq(0).text()) + "</userName>"), n.push("<streamType>" + s.$XML(u).find("streamType").eq(0).text() + "</streamType>"), n.push("<online>" + s.$XML(u).find("online").eq(0).text() + "</online>"), n.push("<name>" + I.escape(r[c]) + "</name>"), n.push("</sourceInputPortDescriptor>"), n.push("</InputProxyChannelStatus>")
                            }
                            n.push("</InputProxyChannelStatusList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                        },
                        error: function (e, s) {
                            t.error && t.error(e, s)
                        }
                    }), i.setRequestParam(a), i.submitRequest()
                }
            }, se.prototype.getZeroChannelInfo = function (e, t) {
                var s = k(this.CGI.getZeroChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getStreamChannels = function (e, t) {
                if (0 != e.iAnalogChannelNum) var s = k(this.CGI.getStreamChannels.analog, e.szHttpProtocol, e.szIP, e.iCGIPort);
                else var s = k(this.CGI.getStreamChannels.digital, e.szHttpProtocol, e.szIP, e.iCGIPort);
                var n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getPPPoEStatus = function (e, t) {
                var s = k(this.CGI.getPPPoEStatus, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getUPnPPortStatus = function (e, t) {
                var s = k(this.CGI.getUPnPPortStatus, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getNetworkBond = function (e, t) {
                var s = k(this.CGI.getNetworkBond, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getNetworkInterface = function (e, t) {
                var s = k(this.CGI.getNetworkInterface, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.getPortInfo = function (e, t) {
                var s = k(this.CGI.getPortInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.startRealPlay = function (e, t) {
                var s = 100 * t.iChannelID + t.iStreamType,
                    n = "";
                n = t.bZeroChannel ? k(t.cgi.zeroChannels, t.urlProtocol, e.szIP, t.iPort, s) : k(t.cgi.channels, t.urlProtocol, e.szIP, t.iPort, s);
                var r = u.HWP_Play(n, e.szAuth, t.iWndIndex, "", "");
                if (0 == r) {
                    var o = new ee;
                    o.iIndex = t.iWndIndex, o.szIP = e.szIP, o.iChannelID = t.iChannelID, o.iPlayStatus = g, p.push(o)
                }
                return r
            }, se.prototype.startVoiceTalk = function (e, t) {
                var s = k(this.CGI.startVoiceTalk.open, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    n = k(this.CGI.startVoiceTalk.close, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    r = k(this.CGI.startVoiceTalk.audioData, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    o = u.HWP_StartVoiceTalk(s, n, r, e.szAuth, e.iAudioType);
                return o
            }, se.prototype.ptzAutoControl = function (e, t, s, n) {
                var r = s.iChannelID,
                    o = "",
                    i = "";
                if (n.iPTZSpeed = n.iPTZSpeed < 7 ? 15 * n.iPTZSpeed : 100, t && (n.iPTZSpeed = 0), e.szDeviceType != X) o = r <= e.iAnalogChannelNum ? k(this.CGI.ptzAutoControl.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID) : s.bShttpIPChannel ? k(this.CGI.ptzAutoControl.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum) : k(this.CGI.ptzAutoControl.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID), i = "<?xml version='1.0' encoding='UTF-8'?><autoPanData><autoPan>" + n.iPTZSpeed + "</autoPan></autoPanData>";
                else {
                    var a = 99;
                    t && (a = 96), o = k(this.CGI.ptzAutoControl.ipdome, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID, a)
                }
                var u = new te,
                    c = {
                        type: "PUT",
                        url: o,
                        async: !1,
                        auth: e.szAuth,
                        data: i,
                        success: null,
                        error: null
                    },
                    l = this;
                I.extend(c, n), I.extend(c, {
                    success: function (e) {
                        s.bPTZAuto = !s.bPTZAuto, n.success && n.success(e)
                    },
                    error: function (t, r) {
                        if (G == e.szDeviceType || H == e.szDeviceType) {
                            o = s.bShttpIPChannel ? k(l.CGI.ptzControl.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum) : k(l.CGI.ptzControl.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID), i = "<?xml version='1.0' encoding='UTF-8'?><PTZData><pan>" + n.iPTZSpeed + "</pan><tilt>0</tilt></PTZData>";
                            var a = new te,
                                u = {
                                    type: "PUT",
                                    url: o,
                                    async: !1,
                                    auth: e.szAuth,
                                    data: i,
                                    success: null,
                                    error: null
                                };
                            I.extend(u, n), a.setRequestParam(u), a.submitRequest()
                        } else n.error && n.error(t, r)
                    }
                }), u.setRequestParam(c), u.submitRequest()
            }, se.prototype.ptzControl = function (e, t, s, n) {
                var r = s.iChannelID,
                    o = "";
                s.bPTZAuto && this.ptzAutoControl(e, !0, s, {
                    iPTZSpeed: 0
                }), t ? n.iPTZSpeed = 0 : n.iPTZSpeed = n.iPTZSpeed < 7 ? 15 * n.iPTZSpeed : 100;
                var i = [{}, {
                    pan: 0,
                    tilt: n.iPTZSpeed
                }, {
                    pan: 0,
                    tilt: -n.iPTZSpeed
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: 0
                }, {
                    pan: n.iPTZSpeed,
                    tilt: 0
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: n.iPTZSpeed
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: -n.iPTZSpeed
                }, {
                    pan: n.iPTZSpeed,
                    tilt: n.iPTZSpeed
                }, {
                    pan: n.iPTZSpeed,
                    tilt: -n.iPTZSpeed
                }, {}, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }],
                    a = "",
                    u = {};
                switch (n.iPTZIndex) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                        u = this.CGI.ptzControl, a = "<?xml version='1.0' encoding='UTF-8'?><PTZData><pan>" + i[n.iPTZIndex].pan + "</pan><tilt>" + i[n.iPTZIndex].tilt + "</tilt></PTZData>";
                        break;
                    case 10:
                    case 11:
                        u = this.CGI.ptzControl, a = "<?xml version='1.0' encoding='UTF-8'?><PTZData><zoom>" + i[n.iPTZIndex].speed + "</zoom></PTZData>";
                        break;
                    case 12:
                    case 13:
                        u = this.CGI.ptzFocus, a = "<?xml version='1.0' encoding='UTF-8'?><FocusData><focus>" + i[n.iPTZIndex].speed + "</focus></FocusData>";
                        break;
                    case 14:
                    case 15:
                        u = this.CGI.ptzIris, a = "<?xml version='1.0' encoding='UTF-8'?><IrisData><iris>" + i[n.iPTZIndex].speed + "</iris></IrisData>";
                        break;
                    default:
                        return void (W(n.error) && n.error())
                }
                o = u != this.CGI.ptzFocus && u != this.CGI.ptzIris || e.szDeviceType != G && e.szDeviceType != X && e.szDeviceType != H ? r <= e.iAnalogChannelNum ? k(u.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID) : s.bShttpIPChannel ? k(u.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum) : k(u.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID) : k(u.ipc, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID);
                var c = new te,
                    l = {
                        type: "PUT",
                        url: o,
                        async: !1,
                        auth: e.szAuth,
                        data: a,
                        success: null,
                        error: null
                    };
                I.extend(l, n), I.extend(l, {
                    success: function (e) {
                        n.success && n.success(e)
                    },
                    error: function (e, t) {
                        n.error && n.error(e, t)
                    }
                }), c.setRequestParam(l), c.submitRequest()
            }, se.prototype.setPreset = function (e, t, s) {
                var n = t.iChannelID,
                    r = "",
                    o = "";
                r = n <= e.iAnalogChannelNum ? k(this.CGI.setPreset.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID) : t.bShttpIPChannel ? k(this.CGI.setPreset.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum, s.iPresetID) : k(this.CGI.setPreset.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID), o = "<?xml version='1.0' encoding='UTF-8'?>", o += "<PTZPreset>", o += "<id>" + s.iPresetID + "</id>", e.szDeviceType != X && (o += "<presetName>Preset" + s.iPresetID + "</presetName>"), o += "</PTZPreset>";
                var i = new te,
                    a = {
                        type: "PUT",
                        url: r,
                        auth: e.szAuth,
                        data: o,
                        success: null,
                        error: null
                    };
                I.extend(a, s), I.extend(a, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), i.setRequestParam(a), i.submitRequest()
            }, se.prototype.goPreset = function (e, t, s) {
                var n = t.iChannelID,
                    r = "";
                r = n <= e.iAnalogChannelNum ? k(this.CGI.goPreset.analog, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID) : t.bShttpIPChannel ? k(this.CGI.goPreset.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum, s.iPresetID) : k(this.CGI.goPreset.digital, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID);
                var o = new te,
                    i = {
                        type: "PUT",
                        url: r,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(i, s), I.extend(i, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), o.setRequestParam(i), o.submitRequest()
            }, se.prototype.recordSearch = function (e, n) {
                var r = "",
                    o = "",
                    i = n.iChannelID,
                    a = n.szStartTime.replace(" ", "T") + "Z",
                    u = n.szEndTime.replace(" ", "T") + "Z";
                r = k(this.CGI.recordSearch, e.szHttpProtocol, e.szIP, e.iCGIPort), o = "<?xml version='1.0' encoding='UTF-8'?><CMSearchDescription><searchID>" + new t + "</searchID><trackList><trackID>" + (100 * i + 1) + "</trackID></trackList><timeSpanList><timeSpan><startTime>" + a + "</startTime><endTime>" + u + "</endTime></timeSpan></timeSpanList><maxResults>40</maxResults><searchResultPostion>" + n.iSearchPos + "</searchResultPostion><metadataList><metadataDescriptor>//metadata.ISAPI.org/VideoMotion</metadataDescriptor></metadataList></CMSearchDescription>";
                var c = new te,
                    l = {
                        type: "POST",
                        url: r,
                        auth: e.szAuth,
                        data: o,
                        success: null,
                        error: null
                    };
                I.extend(l, n), I.extend(l, {
                    success: function (e) {
                        var t = [];
                        t.push("<CMSearchResult>"), t.push("<responseStatus>" + s.$XML(e).find("responseStatus").eq(0).text() + "</responseStatus>"), t.push("<responseStatusStrg>" + s.$XML(e).find("responseStatusStrg").eq(0).text() + "</responseStatusStrg>"), t.push("<numOfMatches>" + s.$XML(e).find("numOfMatches").eq(0).text() + "</numOfMatches>"), t.push("<matchList>");
                        for (var r = s.$XML(e).find("searchMatchItem", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            t.push("<searchMatchItem>"), t.push("<trackID>" + s.$XML(a).find("trackID").eq(0).text() + "</trackID>"), t.push("<startTime>" + s.$XML(a).find("startTime").eq(0).text() + "</startTime>"), t.push("<endTime>" + s.$XML(a).find("endTime").eq(0).text() + "</endTime>"), t.push("<playbackURI>" + I.escape(s.$XML(a).find("playbackURI").eq(0).text()) + "</playbackURI>"), t.push("<metadataDescriptor>" + s.$XML(a).find("metadataDescriptor").eq(0).text().split("/")[1] + "</metadataDescriptor>"), t.push("</searchMatchItem>")
                        }
                        t.push("</matchList>"), t.push("</CMSearchResult>"), e = I.loadXML(t.join("")), n.success && n.success(e)
                    },
                    error: function (e, t) {
                        n.error && n.error(e, t)
                    }
                }), c.setRequestParam(l), c.submitRequest()
            }, se.prototype.startPlayback = function (e, t) {
                var s = t.iWndIndex,
                    n = t.szStartTime,
                    r = t.szEndTime,
                    o = k(t.cgi, t.urlProtocol, e.szIP, t.iPort, t.iChannelID, n, r);
                if (!W(t.oTransCodeParam)) {
                    var i = Y(t.oTransCodeParam);
                    if ("" == i) return -1;
                    u.HWP_SetTrsPlayBackParam(s, i)
                }
                var a = u.HWP_Play(o, e.szAuth, s, n, r);
                if (0 == a) {
                    var c = new ee;
                    c.iIndex = s, c.szIP = e.szIP, c.iChannelID = t.iChannelID, c.iPlayStatus = x, p.push(c)
                }
                return a
            }, se.prototype.reversePlayback = function (e, t) {
                var s = t.iWndIndex,
                    n = t.szStartTime,
                    r = t.szEndTime,
                    o = k(t.cgi, t.urlProtocol, e.szIP, t.iPort, t.iChannelID, n, r),
                    i = u.HWP_ReversePlay(o, e.szAuth, s, n, r);
                if (0 == i) {
                    var a = new ee;
                    a.iIndex = s, a.szIP = e.szIP, a.iChannelID = t.iChannelID, a.iPlayStatus = D, p.push(a)
                }
                return i
            }, se.prototype.startDownloadRecord = function (e, t) {
                var s = k(this.CGI.startDownloadRecord, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = "<?xml version='1.0' encoding='UTF-8'?><downloadRequest><playbackURI> " + I.escape(t.szPlaybackURI) + "</playbackURI></downloadRequest>";
                return u.HWP_StartDownload(s, e.szAuth, t.szFileName, n)
            }, se.prototype.exportDeviceConfig = function (e) {
                var t = k(this.CGI.deviceConfig, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_ExportDeviceConfig(t, e.szAuth, "", 0)
            }, se.prototype.importDeviceConfig = function (e, t) {
                var s = k(this.CGI.deviceConfig, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_ImportDeviceConfig(s, e.szAuth, t.szFileName, 0)
            }, se.prototype.restart = function (e, t) {
                var s = k(this.CGI.restart, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "PUT",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, se.prototype.restore = function (e, t, s) {
                var n = k(this.CGI.restore, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    r = new te,
                    o = {
                        type: "PUT",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, s), I.extend(o, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, se.prototype.startUpgrade = function (e, t) {
                var s = k(this.CGI.startUpgrade.upgrade, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = k(this.CGI.startUpgrade.status, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_StartUpgrade(s, n, e.szAuth, t.szFileName)
            }, se.prototype.set3DZoom = function (e, t, n, r) {
                var o = t.iChannelID,
                    i = "";
                i = o <= e.iAnalogChannelNum ? k(this.CGI.set3DZoom, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID) : t.bShttpIPChannel ? k(this.CGI.set3DZoom, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID - e.oStreamCapa.iIpChanBase + 1 + e.iAnalogChannelNum) : k(this.CGI.set3DZoom, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID);
                var a = I.loadXML(n),
                    u = parseInt(s.$XML(a).find("StartPoint").eq(0).find("positionX").eq(0).text(), 10),
                    c = parseInt(s.$XML(a).find("StartPoint").eq(0).find("positionY").eq(0).text(), 10),
                    l = parseInt(s.$XML(a).find("EndPoint").eq(0).find("positionX").eq(0).text(), 10),
                    p = parseInt(s.$XML(a).find("EndPoint").eq(0).find("positionY").eq(0).text(), 10),
                    d = "<?xml version='1.0' encoding='UTF-8'?><position3D><StartPoint><positionX>" + u + "</positionX><positionY>" + (255 - c) + "</positionY></StartPoint><EndPoint><positionX>" + l + "</positionX><positionY>" + (255 - p) + "</positionY></EndPoint></position3D>",
                    P = new te,
                    h = {
                        type: "PUT",
                        url: i,
                        data: d,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(h, r), I.extend(h, {
                    success: function (e) {
                        r.success && r.success(e)
                    },
                    error: function (e, t) {
                        r.error && r.error(e, t)
                    }
                }), P.setRequestParam(h), P.submitRequest()
            }, se.prototype.getSDKCapa = function (e, t) {
                var s = k(this.CGI.SDKCapabilities, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            };
            var ne = function () { };
            ne.prototype.CGI = {
                login: "%s%s:%s/PSIA/Custom/SelfExt/userCheck",
                getAudioInfo: "%s%s:%s/PSIA/Custom/SelfExt/TwoWayAudio/channels",
                getDeviceInfo: "%s%s:%s/PSIA/System/deviceInfo",
                getAnalogChannelInfo: "%s%s:%s/PSIA/System/Video/inputs/channels",
                getDigitalChannel: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/DynVideo/inputs/channels",
                getDigitalChannelInfo: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/DynVideo/inputs/channels/status",
                getZeroChannelInfo: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/ZeroVideo/channels",
                getStreamChannels: {
                    analog: "%s%s:%s/PSIA/Streaming/channels",
                    digital: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/DynStreaming/channels"
                },
                getStreamDynChannels: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/DynStreaming/channels",
                startRealPlay: {
                    channels: "%s%s:%s/PSIA/streaming/channels/%s",
                    zeroChannels: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/ZeroStreaming/channels/%s"
                },
                startVoiceTalk: {
                    open: "%s%s:%s/PSIA/Custom/SelfExt/TwoWayAudio/channels/%s/open",
                    close: "%s%s:%s/PSIA/Custom/SelfExt/TwoWayAudio/channels/%s/close",
                    audioData: "%s%s:%s/PSIA/Custom/SelfExt/TwoWayAudio/channels/%s/audioData"
                },
                ptzControl: "%s%s:%s/PSIA/PTZ/channels/%s/continuous",
                ptzAutoControl: "%s%s:%s/PSIA/Custom/SelfExt/PTZ/channels/%s/autoptz",
                setPreset: "%s%s:%s/PSIA/PTZ/channels/%s/presets/%s",
                goPreset: "%s%s:%s/PSIA/PTZ/channels/%s/presets/%s/goto",
                ptzFocus: "%s%s:%s/PSIA/System/Video/inputs/channels/%s/focus",
                ptzIris: "%s%s:%s/PSIA/System/Video/inputs/channels/%s/iris",
                getNetworkBond: "%s%s:%s/PSIA/Custom/SelfExt/Bond",
                getNetworkInterface: "%s%s:%s/PSIA/System/Network/interfaces",
                getUPnPPortStatus: "%s%s:%s/PSIA/Custom/SelfExt/UPnP/ports/status",
                getPPPoEStatus: "%s%s:%s/PSIA/Custom/SelfExt/PPPoE/1/status",
                getPortInfo: "%s%s:%s/PSIA/Security/AAA/adminAccesses",
                recordSearch: "%s%s:%s/PSIA/ContentMgmt/search",
                startPlayback: "%s%s:%s/PSIA/streaming/tracks/%s?starttime=%s&endtime=%s",
                startDownloadRecord: "%s%s:%s/PSIA/Custom/SelfExt/ContentMgmt/download",
                deviceConfig: "%s%s:%s/PSIA/System/configurationData",
                restart: "%s%s:%s/PSIA/System/reboot",
                restore: "%s%s:%s/PSIA/System/factoryReset?mode=%s",
                startUpgrade: {
                    upgrade: "%s%s:%s/PSIA/System/updateFirmware",
                    status: "%s%s:%s/PSIA/Custom/SelfExt/upgradeStatus"
                },
                set3DZoom: "%s%s:%s/PSIA/Custom/SelfExt/PTZ/channels/%s/Set3DZoom"
            }, ne.prototype.login = function (e, t, n, r) {
                var o = 2 == r.protocol ? "https://" : "http://",
                    i = k(this.CGI.login, o, e, t),
                    a = new te,
                    u = {
                        type: "GET",
                        url: i,
                        auth: n,
                        success: null,
                        error: null
                    };
                I.extend(u, r), I.extend(u, {
                    success: function (e) {
                        "200" == s.$XML(e).find("statusValue").eq(0).text() ? r.success && r.success(e) : r.error && r.error(401, e)
                    },
                    error: function (e, t) {
                        r.error && r.error(e, t)
                    }
                }), a.setRequestParam(u), a.submitRequest()
            }, ne.prototype.getAudioInfo = function (e, t) {
                var s = k(this.CGI.getAudioInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getDeviceInfo = function (e, t) {
                var n = k(this.CGI.getDeviceInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<DeviceInfo>"), n.push("<deviceName>" + I.escape(s.$XML(e).find("deviceName").eq(0).text()) + "</deviceName>"), n.push("<deviceID>" + s.$XML(e).find("deviceID").eq(0).text() + "</deviceID>"), n.push("<deviceType>" + s.$XML(e).find("deviceDescription").eq(0).text() + "</deviceType>"), n.push("<model>" + s.$XML(e).find("model").eq(0).text() + "</model>"), n.push("<serialNumber>" + s.$XML(e).find("serialNumber").eq(0).text() + "</serialNumber>"), n.push("<macAddress>" + s.$XML(e).find("macAddress").eq(0).text() + "</macAddress>"), n.push("<firmwareVersion>" + s.$XML(e).find("firmwareVersion").eq(0).text() + "</firmwareVersion>"), n.push("<firmwareReleasedDate>" + s.$XML(e).find("firmwareReleasedDate").eq(0).text() + "</firmwareReleasedDate>"), n.push("<encoderVersion>" + s.$XML(e).find("logicVersion").eq(0).text() + "</encoderVersion>"), n.push("<encoderReleasedDate>" + s.$XML(e).find("logicReleasedDate").eq(0).text() + "</encoderReleasedDate>"), n.push("</DeviceInfo>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.getAnalogChannelInfo = function (e, t) {
                var n = k(this.CGI.getAnalogChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<VideoInputChannelList>");
                        for (var r = s.$XML(e).find("VideoInputChannel", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            n.push("<VideoInputChannel>"), n.push("<id>" + s.$XML(a).find("id").eq(0).text() + "</id>"), n.push("<inputPort>" + s.$XML(a).find("inputPort").eq(0).text() + "</inputPort>"), n.push("<name>" + I.escape(s.$XML(a).find("name").eq(0).text()) + "</name>"), n.push("<videoFormat>" + s.$XML(a).find("videoFormat").eq(0).text() + "</videoFormat>"), n.push("</VideoInputChannel>")
                        }
                        n.push("</VideoInputChannelList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.getDigitalChannel = function (e, t) {
                var n = k(this.CGI.getDigitalChannel, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (e) {
                        var n = [];
                        n.push("<InputProxyChannelList>");
                        for (var r = s.$XML(e).find("DynVideoInputChannel", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            n.push("<InputProxyChannel>"), n.push("<id>" + s.$XML(a).find("id").eq(0).text() + "</id>"), n.push("<name>" + I.escape(s.$XML(a).find("name").eq(0).text()) + "</name>"), n.push("</InputProxyChannel>")
                        }
                        n.push("</InputProxyChannelList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.getDigitalChannelInfo = function (e, t) {
                var n = null,
                    r = {};
                if (this.getDigitalChannel(e, {
                    async: !1,
                    success: function (e) {
                        n = e;
                        for (var t = s.$XML(n).find("InputProxyChannel", !0), o = 0, i = t.length; i > o; o++) {
                            var a = t[o],
                                u = s.$XML(a).find("id").eq(0).text(),
                                c = s.$XML(a).find("name").eq(0).text();
                            r[u] = c
                }
                },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                }
                }), null !== n) {
                    var o = k(this.CGI.getDigitalChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                        i = new te,
                        a = {
                            type: "GET",
                            url: o,
                            auth: e.szAuth,
                            success: null,
                            error: null
                        };
                    I.extend(a, t), I.extend(a, {
                        success: function (e) {
                            var n = [];
                            n.push("<InputProxyChannelStatusList>");
                            for (var o = s.$XML(e).find("DynVideoInputChannelStatus", !0), i = 0, a = o.length; a > i; i++) {
                                var u = o[i],
                                    c = s.$XML(u).find("id").eq(0).text();
                                n.push("<InputProxyChannelStatus>"), n.push("<id>" + c + "</id>"), n.push("<sourceInputPortDescriptor>"), n.push("<proxyProtocol>" + s.$XML(u).find("adminProtocol").eq(0).text() + "</proxyProtocol>"), n.push("<addressingFormatType>" + s.$XML(u).find("addressingFormatType").eq(0).text() + "</addressingFormatType>"), n.push("<ipAddress>" + s.$XML(u).find("ipAddress").eq(0).text() + "</ipAddress>"), n.push("<managePortNo>" + s.$XML(u).find("adminPortNo").eq(0).text() + "</managePortNo>"), n.push("<srcInputPort>" + s.$XML(u).find("srcInputPort").eq(0).text() + "</srcInputPort>"), n.push("<userName>" + I.escape(s.$XML(u).find("userName").eq(0).text()) + "</userName>"), n.push("<streamType>" + s.$XML(u).find("streamType").eq(0).text() + "</streamType>"), n.push("<online>" + s.$XML(u).find("online").eq(0).text() + "</online>"), n.push("<name>" + I.escape(r[c]) + "</name>"), n.push("</sourceInputPortDescriptor>"), n.push("</InputProxyChannelStatus>")
                            }
                            n.push("</InputProxyChannelStatusList>"), e = I.loadXML(n.join("")), t.success && t.success(e)
                        },
                        error: function (e, s) {
                            t.error && t.error(e, s)
                        }
                    }), i.setRequestParam(a), i.submitRequest()
                }
            }, ne.prototype.getZeroChannelInfo = function (e, t) {
                var s = k(this.CGI.getZeroChannelInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getPPPoEStatus = function (e, t) {
                var s = k(this.CGI.getPPPoEStatus, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getUPnPPortStatus = function (e, t) {
                var s = k(this.CGI.getUPnPPortStatus, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getNetworkBond = function (e, t) {
                var s = k(this.CGI.getNetworkBond, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getNetworkInterface = function (e, t) {
                var s = k(this.CGI.getNetworkInterface, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getPortInfo = function (e, t) {
                var n = k(this.CGI.getPortInfo, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    r = new te,
                    o = {
                        type: "GET",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, t), I.extend(o, {
                    success: function (n) {
                        var r = [];
                        r.push("<AdminAccessProtocolList>");
                        for (var o = s.$XML(n).find("AdminAccessProtocol", !0), i = 0, a = o.length; a > i; i++) {
                            o[i];
                            r.push("<AdminAccessProtocol>"), r.push("<id>" + s.$XML(n).find("id").eq(0).text() + "</id>"), r.push("<enabled>" + s.$XML(n).find("enabled").eq(0).text() + "</enabled>"), r.push("<protocol>" + s.$XML(n).find("protocol").eq(0).text().toUpperCase() + "</protocol>"), r.push("<portNo>" + s.$XML(n).find("portNo").eq(0).text() + "</portNo>"), r.push("</AdminAccessProtocol>")
                        }
                        h.getStreamChannels(e, {
                            async: !1,
                            success: function (n) {
                                if (s.$XML(n).find("rtspPortNo", !0).length > 0) {
                                    var o = parseInt(s.$XML(n).find("rtspPortNo").eq(0).text(), 10);
                                    r.push("<AdminAccessProtocol>"), r.push("<id>4</id>"), r.push("<enabled>true</enabled>"), r.push("<protocol>RTSP</protocol>"), r.push("<portNo>" + o + "</portNo>"), r.push("</AdminAccessProtocol>"), r.push("</AdminAccessProtocolList>");
                                    var i = I.loadXML(r.join(""));
                                    t.success && t.success(i)
                                } else h.getStreamDynChannels(e, {
                                    async: !1,
                                    success: function (e) {
                                        if (s.$XML(e).find("rtspPortNo", !0).length > 0) {
                                            var n = parseInt(s.$XML(e).find("rtspPortNo").eq(0).text(), 10);
                                            r.push("<AdminAccessProtocol>"), r.push("<id>4</id>"), r.push("<enabled>true</enabled>"), r.push("<protocol>RTSP</protocol>"), r.push("<portNo>" + n + "</portNo>"), r.push("</AdminAccessProtocol>"), r.push("</AdminAccessProtocolList>");
                                            var o = I.loadXML(r.join(""));
                                            t.success && t.success(o)
                                        }
                                    },
                                    error: function () {
                                        t.error && t.error()
                                    }
                                })
                            },
                            error: function () {
                                t.error && t.error()
                            }
                        })
                    },
                    error: function () {
                        var n = [];
                        n.push("<AdminAccessProtocolList>"), h.getStreamChannels(e, {
                            async: !1,
                            success: function (r) {
                                if (s.$XML(r).find("rtspPortNo", !0).length > 0) {
                                    var o = parseInt(s.$XML(r).find("rtspPortNo").eq(0).text(), 10);
                                    n.push("<AdminAccessProtocol>"), n.push("<id>4</id>"), n.push("<enabled>true</enabled>"), n.push("<protocol>RTSP</protocol>"), n.push("<portNo>" + o + "</portNo>"), n.push("</AdminAccessProtocol>"), n.push("</AdminAccessProtocolList>");
                                    var i = I.loadXML(n.join(""));
                                    t.success && t.success(i)
                                } else h.getStreamDynChannels(e, {
                                    async: !1,
                                    success: function (e) {
                                        if (s.$XML(e).find("rtspPortNo", !0).length > 0) {
                                            var r = parseInt(s.$XML(e).find("rtspPortNo").eq(0).text(), 10);
                                            n.push("<AdminAccessProtocol>"), n.push("<id>4</id>"), n.push("<enabled>true</enabled>"), n.push("<protocol>RTSP</protocol>"), n.push("<portNo>" + r + "</portNo>"), n.push("</AdminAccessProtocol>"), n.push("</AdminAccessProtocolList>");
                                            var o = I.loadXML(n.join(""));
                                            t.success && t.success(o)
                                        }
                                    },
                                    error: function () {
                                        t.error && t.error()
                                    }
                                })
                            },
                            error: function () {
                                t.error && t.error()
                            }
                        })
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.getStreamChannels = function (e, t) {
                if (0 != e.iAnalogChannelNum) var s = k(this.CGI.getStreamChannels.analog, e.szHttpProtocol, e.szIP, e.iCGIPort);
                else var s = k(this.CGI.getStreamChannels.digital, e.szHttpProtocol, e.szIP, e.iCGIPort);
                var n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.getStreamDynChannels = function (e, t) {
                var s = k(this.CGI.getStreamDynChannels, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "GET",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.startRealPlay = function (e, t) {
                var s = 100 * t.iChannelID + t.iStreamType,
                    n = "";
                n = t.bZeroChannel ? k(t.cgi.zeroChannels, t.urlProtocol, e.szIP, t.iPort, s) : k(t.cgi.channels, t.urlProtocol, e.szIP, t.iPort, s);
                var r = u.HWP_Play(n, e.szAuth, t.iWndIndex, "", "");
                if (0 == r) {
                    var o = new ee;
                    o.iIndex = t.iWndIndex, o.szIP = e.szIP, o.iChannelID = t.iChannelID, o.iPlayStatus = g, p.push(o)
                }
                return r
            }, ne.prototype.startVoiceTalk = function (e, t) {
                var s = k(this.CGI.startVoiceTalk.open, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    n = k(this.CGI.startVoiceTalk.close, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    r = k(this.CGI.startVoiceTalk.audioData, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    o = u.HWP_StartVoiceTalk(s, n, r, e.szAuth, e.iAudioType);
                return o
            }, ne.prototype.ptzAutoControl = function (e, t, s, n) {
                var r = s.iChannelID,
                    o = "",
                    i = "";
                if (n.iPTZSpeed = n.iPTZSpeed < 7 ? 15 * n.iPTZSpeed : 100, t && (n.iPTZSpeed = 0), e.szDeviceType != X) o = k(this.CGI.ptzAutoControl, e.szHttpProtocol, e.szIP, e.iCGIPort, r), i = "<?xml version='1.0' encoding='UTF-8'?><PTZData><pan>" + n.iPTZSpeed + "</pan><tilt>0</tilt></PTZData>";
                else {
                    var a = 99;
                    t && (a = 96), o = k(this.CGI.goPreset, e.szHttpProtocol, e.szIP, e.iCGIPort, r, a)
                }
                var u = new te,
                    c = {
                        type: "PUT",
                        url: o,
                        async: !1,
                        auth: e.szAuth,
                        data: i,
                        success: null,
                        error: null
                    },
                    l = this;
                I.extend(c, n), I.extend(c, {
                    success: function (e) {
                        s.bPTZAuto = !s.bPTZAuto, n.success && n.success(e)
                    },
                    error: function (t, r) {
                        if (e.szDeviceType != X) {
                            o = k(l.CGI.ptzControl, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID);
                            var a = new te,
                                u = {
                                    type: "PUT",
                                    url: o,
                                    async: !1,
                                    auth: e.szAuth,
                                    data: i,
                                    success: null,
                                    error: null
                                };
                            I.extend(u, n), a.setRequestParam(u), a.submitRequest()
                        } else n.error && n.error(t, r)
                    }
                }), u.setRequestParam(c), u.submitRequest()
            }, ne.prototype.ptzControl = function (e, t, s, n) {
                var r = (s.iChannelID, "");
                s.bPTZAuto && this.ptzAutoControl(e, !0, s, {
                    iPTZSpeed: 0
                }), t ? n.iPTZSpeed = 0 : n.iPTZSpeed = n.iPTZSpeed < 7 ? 15 * n.iPTZSpeed : 100;
                var o = [{}, {
                    pan: 0,
                    tilt: n.iPTZSpeed
                }, {
                    pan: 0,
                    tilt: -n.iPTZSpeed
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: 0
                }, {
                    pan: n.iPTZSpeed,
                    tilt: 0
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: n.iPTZSpeed
                }, {
                    pan: -n.iPTZSpeed,
                    tilt: -n.iPTZSpeed
                }, {
                    pan: n.iPTZSpeed,
                    tilt: n.iPTZSpeed
                }, {
                    pan: n.iPTZSpeed,
                    tilt: -n.iPTZSpeed
                }, {}, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }, {
                    speed: n.iPTZSpeed
                }, {
                    speed: -n.iPTZSpeed
                }],
                    i = "",
                    a = {};
                switch (n.iPTZIndex) {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                        a = this.CGI.ptzControl, i = "<?xml version='1.0' encoding='UTF-8'?><PTZData><pan>" + o[n.iPTZIndex].pan + "</pan><tilt>" + o[n.iPTZIndex].tilt + "</tilt></PTZData>";
                        break;
                    case 10:
                    case 11:
                        a = this.CGI.ptzControl, i = "<?xml version='1.0' encoding='UTF-8'?><PTZData><zoom>" + o[n.iPTZIndex].speed + "</zoom></PTZData>";
                        break;
                    case 12:
                    case 13:
                        a = this.CGI.ptzFocus, i = "<?xml version='1.0' encoding='UTF-8'?><FocusData><focus>" + o[n.iPTZIndex].speed + "</focus></FocusData>";
                        break;
                    case 14:
                    case 15:
                        a = this.CGI.ptzIris, i = "<?xml version='1.0' encoding='UTF-8'?><IrisData><iris>" + o[n.iPTZIndex].speed + "</iris></IrisData>";
                        break;
                    default:
                        return void (W(n.error) && n.error())
                }
                r = k(a, e.szHttpProtocol, e.szIP, e.iCGIPort, s.iChannelID);
                var u = new te,
                    c = {
                        type: "PUT",
                        url: r,
                        async: !1,
                        auth: e.szAuth,
                        data: i,
                        success: null,
                        error: null
                    };
                I.extend(c, n), I.extend(c, {
                    success: function (e) {
                        n.success && n.success(e)
                    },
                    error: function (e, t) {
                        n.error && n.error(e, t)
                    }
                }), u.setRequestParam(c), u.submitRequest()
            }, ne.prototype.setPreset = function (e, t, s) {
                var n = (t.iChannelID, ""),
                    r = "";
                n = k(this.CGI.setPreset, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID), r = "<?xml version='1.0' encoding='UTF-8'?>", r += "<PTZPreset>", r += "<id>" + s.iPresetID + "</id>", e.szDeviceType != X && (r += "<presetName>Preset" + s.iPresetID + "</presetName>"), r += "</PTZPreset>";
                var o = new te,
                    i = {
                        type: "PUT",
                        url: n,
                        auth: e.szAuth,
                        data: r,
                        success: null,
                        error: null
                    };
                I.extend(i, s), I.extend(i, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), o.setRequestParam(i), o.submitRequest()
            }, ne.prototype.goPreset = function (e, t, s) {
                var n = (t.iChannelID, "");
                n = k(this.CGI.goPreset, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID, s.iPresetID);
                var r = new te,
                    o = {
                        type: "PUT",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, s), I.extend(o, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.recordSearch = function (e, n) {
                var r = "",
                    o = "",
                    i = n.iChannelID,
                    a = n.szStartTime.replace(" ", "T") + "Z",
                    u = n.szEndTime.replace(" ", "T") + "Z";
                r = k(this.CGI.recordSearch, e.szHttpProtocol, e.szIP, e.iCGIPort), o = "<?xml version='1.0' encoding='UTF-8'?><CMSearchDescription><searchID>" + new t + "</searchID><trackList><trackID>" + (100 * i + 1) + "</trackID></trackList><timeSpanList><timeSpan><startTime>" + a + "</startTime><endTime>" + u + "</endTime></timeSpan></timeSpanList><maxResults>40</maxResults><searchResultPostion>" + n.iSearchPos + "</searchResultPostion><metadataList><metadataDescriptor>//metadata.psia.org/VideoMotion</metadataDescriptor></metadataList></CMSearchDescription>";
                var c = new te,
                    l = {
                        type: "POST",
                        url: r,
                        auth: e.szAuth,
                        data: o,
                        success: null,
                        error: null
                    };
                I.extend(l, n), I.extend(l, {
                    success: function (e) {
                        var t = [];
                        t.push("<CMSearchResult>"), t.push("<responseStatus>" + s.$XML(e).find("responseStatus").eq(0).text() + "</responseStatus>"), t.push("<responseStatusStrg>" + s.$XML(e).find("responseStatusStrg").eq(0).text() + "</responseStatusStrg>"), t.push("<numOfMatches>" + s.$XML(e).find("numOfMatches").eq(0).text() + "</numOfMatches>"), t.push("<matchList>");
                        for (var r = s.$XML(e).find("searchMatchItem", !0), o = 0, i = r.length; i > o; o++) {
                            var a = r[o];
                            t.push("<searchMatchItem>"), t.push("<trackID>" + s.$XML(a).find("trackID").eq(0).text() + "</trackID>"), t.push("<startTime>" + s.$XML(a).find("startTime").eq(0).text() + "</startTime>"), t.push("<endTime>" + s.$XML(a).find("endTime").eq(0).text() + "</endTime>"), t.push("<playbackURI>" + I.escape(s.$XML(a).find("playbackURI").eq(0).text()) + "</playbackURI>"), t.push("<metadataDescriptor>" + s.$XML(a).find("metadataDescriptor").eq(0).text().split("/")[1] + "</metadataDescriptor>"), t.push("</searchMatchItem>")
                        }
                        t.push("</matchList>"), t.push("</CMSearchResult>"), e = I.loadXML(t.join("")), n.success && n.success(e)
                    },
                    error: function (e, t) {
                        n.error && n.error(e, t)
                    }
                }), c.setRequestParam(l), c.submitRequest()
            }, ne.prototype.startPlayback = function (e, t) {
                var s = t.iWndIndex,
                    n = t.szStartTime,
                    r = t.szEndTime,
                    o = k(t.cgi, t.urlProtocol, e.szIP, t.iPort, t.iChannelID, n, r),
                    i = u.HWP_Play(o, e.szAuth, s, n, r);
                if (0 == i) {
                    var a = new ee;
                    a.iIndex = s, a.szIP = e.szIP, a.iChannelID = t.iChannelID, a.iPlayStatus = x, p.push(a)
                }
                return i
            }, ne.prototype.reversePlayback = function (e, t) {
                var s = t.iWndIndex,
                    n = t.szStartTime,
                    r = t.szEndTime,
                    o = k(t.cgi, t.urlProtocol, e.szIP, t.iPort, t.iChannelID, n, r),
                    i = u.HWP_ReversePlay(o, e.szAuth, s, n, r);
                if (0 == i) {
                    var a = new ee;
                    a.iIndex = s, a.szIP = e.szIP, a.iChannelID = t.iChannelID, a.iPlayStatus = D, p.push(a)
                }
                return i
            }, ne.prototype.startDownloadRecord = function (e, t) {
                var s = k(this.CGI.startDownloadRecord, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = "<?xml version='1.0' encoding='UTF-8'?><downloadRequest><playbackURI> " + I.escape(t.szPlaybackURI) + "</playbackURI></downloadRequest>";
                return u.HWP_StartDownload(s, e.szAuth, t.szFileName, n)
            }, ne.prototype.exportDeviceConfig = function (e) {
                var t = k(this.CGI.deviceConfig, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_ExportDeviceConfig(t, e.szAuth, "", 0)
            }, ne.prototype.importDeviceConfig = function (e, t) {
                var s = k(this.CGI.deviceConfig, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_ImportDeviceConfig(s, e.szAuth, t.szFileName, 0)
            }, ne.prototype.restart = function (e, t) {
                var s = k(this.CGI.restart, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = new te,
                    r = {
                        type: "PUT",
                        url: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(r, t), I.extend(r, {
                    success: function (e) {
                        t.success && t.success(e)
                    },
                    error: function (e, s) {
                        t.error && t.error(e, s)
                    }
                }), n.setRequestParam(r), n.submitRequest()
            }, ne.prototype.restore = function (e, t, s) {
                var n = k(this.CGI.restore, e.szHttpProtocol, e.szIP, e.iCGIPort, t),
                    r = new te,
                    o = {
                        type: "PUT",
                        url: n,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(o, s), I.extend(o, {
                    success: function (e) {
                        s.success && s.success(e)
                    },
                    error: function (e, t) {
                        s.error && s.error(e, t)
                    }
                }), r.setRequestParam(o), r.submitRequest()
            }, ne.prototype.startUpgrade = function (e, t) {
                var s = k(this.CGI.startUpgrade.upgrade, e.szHttpProtocol, e.szIP, e.iCGIPort),
                    n = k(this.CGI.startUpgrade.status, e.szHttpProtocol, e.szIP, e.iCGIPort);
                return u.HWP_StartUpgrade(s, n, e.szAuth, t.szFileName)
            }, ne.prototype.set3DZoom = function (e, t, s, n) {
                var r = k(this.CGI.set3DZoom, e.szHttpProtocol, e.szIP, e.iCGIPort, t.iChannelID),
                    o = new te,
                    i = {
                        type: "PUT",
                        url: r,
                        data: s,
                        auth: e.szAuth,
                        success: null,
                        error: null
                    };
                I.extend(i, n), I.extend(i, {
                    success: function (e) {
                        n.success && n.success(e)
                    },
                    error: function (e, t) {
                        n.error && n.error(e, t)
                    }
                }), o.setRequestParam(i), o.submitRequest()
            };
            var re = function () { };
            re.prototype._alert = function (e) {
                a.bDebugMode && console.log(e)
            }, function (t) {
                var s = function (e) {
                    this.elems = [], this.length = 0, this.length = this.elems.push(e)
                };
                s.prototype.find = function (e, t) {
                    var s = this.elems[this.length - 1].getElementsByTagName(e);
                    return this.length = this.elems.push(s), t ? s : this
                }, s.prototype.eq = function (e, t) {
                    var s = this.elems[this.length - 1].length,
                        n = null;
                    return s > 0 && s > e && (n = this.elems[this.length - 1][e]), this.length = this.elems.push(n), t ? n : this
                }, s.prototype.text = function (t) {
                    return this.elems[this.length - 1] ? t ? void (e.DOMParser ? this.elems[this.length - 1].textContent = t : this.elems[this.length - 1].text = t) : e.DOMParser ? this.elems[this.length - 1].textContent : this.elems[this.length - 1].text : ""
                }, s.prototype.attr = function (e) {
                    if (this.elems[this.length - 1]) {
                        var t = this.elems[this.length - 1].attributes.getNamedItem(e);
                        return t ? t.value : ""
                    }
                }, t.$XML = function (e) {
                    return new s(e)
                }
            }(this);
            var oe = function () { };
            oe.prototype.extend = function () {
                for (var e, t = arguments[0] || {}, s = 1, n = arguments.length; n > s; s++) if (null != (e = arguments[s])) for (var r in e) {
                    var o = (t[r], e[r]);
                    t !== o && ("object" == typeof o ? t[r] = this.extend({}, o) : void 0 !== o && (t[r] = o))
                }
                return t
            }, oe.prototype.browser = function () {
                var e = /(chrome)[ \/]([\w.]+)/,
                    t = /(safari)[ \/]([\w.]+)/,
                    s = /(opera)(?:.*version)?[ \/]([\w.]+)/,
                    n = /(msie) ([\w.]+)/,
                    r = /(trident.*rv:)([\w.]+)/,
                    o = /(mozilla)(?:.*? rv:([\w.]+))?/,
                    i = navigator.userAgent.toLowerCase(),
                    a = e.exec(i) || t.exec(i) || s.exec(i) || n.exec(i) || r.exec(i) || i.indexOf("compatible") < 0 && o.exec(i) || ["unknow", "0"];
                a.length > 0 && a[1].indexOf("trident") > -1 && (a[1] = "msie");
                var u = {};
                return u[a[1]] = !0, u.version = a[2], u
            }, oe.prototype.loadXML = function (t) {
                if (null == t || "" == t) return null;
                var s = null;
                if (e.DOMParser) {
                    var n = new DOMParser;
                    s = n.parseFromString(t, "text/xml")
                } else s = new ActiveXObject("Microsoft.XMLDOM"), s.async = !1, s.loadXML(t);
                return s
            }, oe.prototype.toXMLStr = function (e) {
                var t = "";
                try {
                    var s = new XMLSerializer;
                    t = s.serializeToString(e)
                } catch (n) {
                    try {
                        t = e.xml
                    } catch (n) {
                        return ""
                    }
                }
                return -1 == t.indexOf("<?xml") && (t = "<?xml version='1.0' encoding='utf-8'?>" + t), t
            }, oe.prototype.escape = function (e) {
                return e.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
            }, oe.prototype.dateFormat = function (e, t) {
                var s = {
                    "M+": e.getMonth() + 1,
                    "d+": e.getDate(),
                    "h+": e.getHours(),
                    "m+": e.getMinutes(),
                    "s+": e.getSeconds(),
                    "q+": Math.floor((e.getMonth() + 3) / 3),
                    S: e.getMilliseconds()
                };
                /(y+)/.test(t) && (t = t.replace(RegExp.$1, (e.getFullYear() + "").substr(4 - RegExp.$1.length)));
                for (var n in s) new RegExp("(" + n + ")").test(t) && (t = t.replace(RegExp.$1, 1 == RegExp.$1.length ? s[n] : ("00" + s[n]).substr(("" + s[n]).length)));
                return t
            }, oe.prototype.Base64 = {
                _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
                encode: function (e) {
                    var t, s, n, r, o, i, a, u = "",
                        c = 0;
                    for (e = oe.prototype.Base64._utf8_encode(e) ; c < e.length;) t = e.charCodeAt(c++), s = e.charCodeAt(c++), n = e.charCodeAt(c++), r = t >> 2, o = (3 & t) << 4 | s >> 4, i = (15 & s) << 2 | n >> 6, a = 63 & n, isNaN(s) ? i = a = 64 : isNaN(n) && (a = 64), u = u + this._keyStr.charAt(r) + this._keyStr.charAt(o) + this._keyStr.charAt(i) + this._keyStr.charAt(a);
                    return u
                },
                decode: function (e) {
                    var t, s, n, r, o, i, a, u = "",
                        c = 0;
                    for (e = e.replace(/[^A-Za-z0-9\+\/\=]/g, "") ; c < e.length;) r = this._keyStr.indexOf(e.charAt(c++)), o = this._keyStr.indexOf(e.charAt(c++)), i = this._keyStr.indexOf(e.charAt(c++)), a = this._keyStr.indexOf(e.charAt(c++)), t = r << 2 | o >> 4, s = (15 & o) << 4 | i >> 2, n = (3 & i) << 6 | a, u += String.fromCharCode(t), 64 != i && (u += String.fromCharCode(s)), 64 != a && (u += String.fromCharCode(n));
                    return u = oe.prototype.Base64._utf8_decode(u)
                },
                _utf8_encode: function (e) {
                    e = e.replace(/\r\n/g, "\n");
                    for (var t = "", s = 0; s < e.length; s++) {
                        var n = e.charCodeAt(s);
                        128 > n ? t += String.fromCharCode(n) : n > 127 && 2048 > n ? (t += String.fromCharCode(n >> 6 | 192), t += String.fromCharCode(63 & n | 128)) : (t += String.fromCharCode(n >> 12 | 224), t += String.fromCharCode(n >> 6 & 63 | 128), t += String.fromCharCode(63 & n | 128))
                    }
                    return t
                },
                _utf8_decode: function (e) {
                    for (var t = "", s = 0, n = c1 = c2 = 0; s < e.length;) n = e.charCodeAt(s), 128 > n ? (t += String.fromCharCode(n), s++) : n > 191 && 224 > n ? (c2 = e.charCodeAt(s + 1), t += String.fromCharCode((31 & n) << 6 | 63 & c2), s += 2) : (c2 = e.charCodeAt(s + 1), c3 = e.charCodeAt(s + 2), t += String.fromCharCode((15 & n) << 12 | (63 & c2) << 6 | 63 & c3), s += 3);
                    return t
                }
            }, t.prototype.valueOf = function () {
                return this.id
            }, t.prototype.toString = function () {
                return this.id
            }, t.prototype.createUUID = function () {
                var e = new Date(1582, 10, 15, 0, 0, 0, 0),
                    s = new Date,
                    n = s.getTime() - e.getTime(),
                    r = "-",
                    o = t.getIntegerBits(n, 0, 31),
                    i = t.getIntegerBits(n, 32, 47),
                    a = t.getIntegerBits(n, 48, 59) + "1",
                    u = t.getIntegerBits(t.rand(4095), 0, 7),
                    c = t.getIntegerBits(t.rand(4095), 0, 7),
                    l = t.getIntegerBits(t.rand(8191), 0, 7) + t.getIntegerBits(t.rand(8191), 8, 15) + t.getIntegerBits(t.rand(8191), 0, 7) + t.getIntegerBits(t.rand(8191), 8, 15) + t.getIntegerBits(t.rand(8191), 0, 15);
                return o + r + i + r + a + r + u + c + r + l
            }, t.getIntegerBits = function (e, s, n) {
                var r = t.returnBase(e, 16),
                    o = new Array,
                    i = "",
                    a = 0;
                for (a = 0; a < r.length; a++) o.push(r.substring(a, a + 1));
                for (a = Math.floor(s / 4) ; a <= Math.floor(n / 4) ; a++) i += o[a] && "" != o[a] ? o[a] : "0";
                return i
            }, t.returnBase = function (e, t) {
                var s = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
                if (t > e) var n = s[e];
                else {
                    var r = "" + Math.floor(e / t),
                        o = e - r * t;
                    if (r >= t) var n = this.returnBase(r, t) + s[o];
                    else var n = s[r] + s[o]
                }
                return n
            }, t.rand = function (e) {
                return Math.floor(Math.random() * e)
            }, P = new se, h = new ne, d = new re, I = new oe;
            var ie = I.dateFormat(new Date, "yyyyMMddhhmmss");
            if (o = "webVideoCtrl" + ie, i = "webVideoCtrl" + ie, "object" != typeof e.attachEvent && I.browser().msie) {
                var ae = "<script for=" + o + " event='GetSelectWndInfo(SelectWndInfo)'>GetSelectWndInfo(SelectWndInfo);</script>";
                ae += "<script for=" + o + " event='ZoomInfoCallback(szZoomInfo)'>ZoomInfoCallback(szZoomInfo);</script>", ae += "<script for=" + o + "  event='GetHttpInfo(lID, lpInfo, lReverse)'>GetHttpInfo(lID, lpInfo, lReverse);</script>", ae += "<script for=" + o + "  event='PluginEventHandler(iEventType, iParam1, iParam2)'>PluginEventHandler(iEventType, iParam1, iParam2);</script>", document.write(ae)
            }
            return this
        }(),
			s = e.WebVideoCtrl = t;
        s.version = "1.0.9"
    }
}(this);