﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="defaultLoginForm.ascx.vb" Inherits="SBS_Inc_Login_defaultLoginForm" %>
<%@ Register Src="/Login/LoginControl.ascx" TagName="LoginControl" TagPrefix="uc2" %>
<form id="form1" runat="server">
    <asp:Panel ID="Panel2" Visible="true" runat="server" Style="margin: 0 auto; width: 969px; height: 632px;">
        <div style="float: right; margin: 0; padding: 0; margin-right: -70px; margin-top: 0px; text-align: right;">
            <asp:Label ID="lblCustomerService" ForeColor="White" runat="server" Text="" Style="margin-right: 15px"></asp:Label>
            <div style="clear: both;"></div>
            <asp:Label ID="lblBackupURL" ForeColor="White" runat="server" Text="" Style="line-height: 30px; margin-right: 15px"></asp:Label>
            <div style="clear: both; height: 7px"></div>
            <uc2:logincontrol id="ucLogin2" runat="server" />
            <div class="flags" style="text-align: right; margin-top: 3px; position: relative; right: 60px; color: red; margin-right: 10px; font-weight: 900">
                <nobr>
	 <a href="Default.aspx" style="color:red" class="menuitem">HOME</a>&nbsp;<span  style="color:red" class="verticalline">|</span>&nbsp;
        <a href="Rules.aspx"  style="color:red" class="menuitem">RULES</a>&nbsp;<span  style="color:red" class="verticalline">|</span>&nbsp;
        <a href="Odds.aspx"  style="color:red" class="menuitem">ODDS &amp; PAYOUT</a>
        </nobr>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel1" Visible="false" runat="server">

        <div class="main_page">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2">
                        <div id="header">

                            <table width="100%" border="0">
                                <tr>
                                    <td align="left">
                                        <img id="imgLogo" runat="server" src="/images/Winsb.png" style="margin-bottom: 20px; margin-top: 10px" />
                                        <div style="text-align: right; vertical-align: top; padding-top: 1px; font-weight: 900; font-size: 15px; float: right">
                                            <asp:Label ID="lblCustomerService2" ForeColor="red" runat="server" Text="" Style="margin-right: 20px"></asp:Label>
                                            <asp:Label ID="lblBackupURL2" ForeColor="red" runat="server" Text=""></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <uc2:logincontrol id="ucLogin" runat="server" />

                                    </td>
                                </tr>
                            </table>

                        </div>
                    </td>
                </tr>
                <tr align="left" valign="top">
                    <td class="right" align="left" style="padding-right: 10px">
                        <img src="/2bet/login_left.png" />

                    </td>
                    <td align="left">

                        <div id="slideshow" class="pics" style="width: 580px; height: 320px; position: relative">
                            <%--<img  src="/images/NewLogin/left1.png"  />
                        <img  src="/images/NewLogin/left2.png"  />
                        <img  src="/images/NewLogin/left3.png"  />
                        <img  src="/images/NewLogin/left4.png"  />
                        <img  src="/images/NewLogin/left5.png"  />--%>
                            <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="584" height="300" style="visibility: visible;">
                                <param name="movie" value="images/flash/Flash.swf">
                                <param name="quality" value="high">
                                <param name="wmode" value="opaque">
                                <param name="swfversion" value="8.0.35.0">
                                <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
                                <param name="expressinstall" value="Scripts/expressInstall.swf">
                                <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
                                <!--[if !IE]>-->
                                <object type="application/x-shockwave-flash" data="/2bet/Flash.swf" width="584" height="300">
                                    <!--<![endif]-->
                                    <param name="quality" value="high">
                                    <param name="wmode" value="opaque">
                                    <param name="swfversion" value="8.0.35.0">
                                    <param name="expressinstall" value="Scripts/expressInstall.swf">
                                    <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
                                    <div>
                                        <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
                                        <p><a href="http://www.adobe.com/go/getflashplayer">
                                            <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33"></a></p>
                                    </div>
                                    <!--[if !IE]>-->
                                </object>
                                <!--<![endif]-->
                            </object>
                        </div>
                        <img src="/2bet/login_bottom.png" />
                    </td>

                </tr>

            </table>

            <iframe src="http://espn.go.com/bottomline/espnewsbottomlinebasic.html" name="espn" width="948" height="44"></iframe>
            <div style="position: relative">
            </div>
        </div>
    </asp:Panel>
</form>
