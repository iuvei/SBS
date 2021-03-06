﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Wagers.ascx.vb" Inherits="SBSWebsite.Wagers" %>
<%@ Register Assembly="WebsiteLibrary" Namespace="WebsiteLibrary" TagPrefix="wlb" %>
<div id="betPickPanel" runat="server" class="row">
    <div id="picks" class="col-lg-12" onkeypress="if(event.keyCode==13){debugger;document.getElementById('cphBody_ucBetActions_ucWagers_btnSubmit').click();return false;}">
        <div id="wagers">

            <div class="pull-right">
                <%--<button type="button" class="btn btn-dark pull-right" onclick='continueBet(this);'>
                                    Continue
                                    <i class="fa fa-forward"></i>
                                </button>--%>

                <asp:Button ID="btnBackGame" runat="server" Text="Back To Game" class="btn btn-default pull-right" Style="margin: 5px" OnClick="btnClearWagers_Click" />
            </div>
            <div class="clearfix"></div>
            <h2 id="trTicketType" runat="server">Wager type : <%=BetTypeActive.Replace("BetTheBoard", "Straight Bet(s)").Replace("Reverse", "Action Reverse").Replace("BetIfAll", "Bet The Board")%>
            </h2>
            <table class="table table-condensed">
                <asp:Repeater ID="rptTickets" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <table class="table table-condensed">
                                    <%--  <tr id="trTicket" runat="server">
                            <td colspan="2" align="left">
                                <asp:Label ID="lblTicketType" runat="server" CssClass="org_txt" Text='<%# Container.DataItem.TicketType%>'></asp:Label>
                                <asp:Label ID="lblIndex" runat="server" CssClass="blue_txt" Text='<%# " (Wager #" & SBCBL.std.SafeString(Container.ItemIndex + 1) & ")"%>'></asp:Label>
                            </td>
                        </tr>--%>

                                    <asp:Repeater ID="rptTicketBets" runat="server" OnItemDataBound="rptTicketBets_ItemDataBound"
                                        OnItemCommand="rptTicketBets_ItemCommand">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background: #f9f9f9">
                                                <td colspan="2" align="center">
                                                    <h5>
                                                        <span style='<%# IIf((SBCBL.std.SafeString(Session("BetTypeActive")).Equals("Straight") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Equals("BetTheBoard") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Contains("If")),"display:none","") %>'>Select #<%#Container.ItemIndex + 1%> </span>
                                                        <span style='<%# IIf((SBCBL.std.SafeString(Session("BetTypeActive")).Equals("Straight") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Equals("BetTheBoard") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Contains("If")),"","display:none") %>'>Select #<%#CType(Container.Parent.Parent, RepeaterItem).ItemIndex + 1%> </span>
                                                        :
                                                    <%#Container.DataItem.GameType.Replace("NCAA Football", "College Football").Replace("CFL Football", "Canadian Football").Replace("AFL Football", "Arena Football")%>
                                                    </h5>
                                                </td>
                                                <td id="tdAmount" visible="false" class="amount" runat="server">
                                                    <h5>Amount</h5>
                                                </td>
                                            </tr>
                                            <tr id="trTicketBet" runat="server">
                                                <td>
                                                    <b>
                                                        <asp:Literal ID="lblTeam" runat="server" Text='<%# SBCBL.std.SafeString(Container.DataItem.Team)%>  '></asp:Literal><span
                                                            style="margin-left: 10px"><%# Container.DataItem.GameDate%>
                                                            - (EST)</span></b>
                                                    <asp:Literal ID="lblContext" runat="server" Text='<%# SBCBL.std.SafeString(iif(LCase(SBCBL.std.SafeString(Container.DataItem.Context)) = "current","for Game",Container.DataItem.Context ))%>'></asp:Literal>
                                                </td>
                                                <td nowrap="nowrap" align="center">
                                                    <asp:Label ID="lblLine" runat="server"></asp:Label>
                                                    <asp:Literal ID="lblBuyPoint" runat="server"></asp:Literal>
                                                </td>
                                                <td id="tdAmount2" visible="false" style="text-align: right" runat="server" class="amount">
                                                    <nobr><asp:TextBox ID="txtAmount" Visible ="false"   CssClass="amount textInput" Width="70px" onkeypress="javascript:return inputNumber(this,event, false);"  runat="server"></asp:TextBox>
                                                    <asp:Button ID="btnDelTicketBet" runat="server" Text="Del" 
                                                        CommandArgument='<%# Container.DataItem.TicketID & "|" & Container.DataItem.TicketBetID%>'
                                                        CommandName="DEL_TICKETBET" />
                                                    </nobr>
                                                </td>
                                            </tr>
                                            <tr style="display: none">
                                                <td></td>
                                                <td nowrap="nowrap" style="text-align: right">


                                                    <%--<asp:Literal ID="lblBuyPoint" runat="server"></asp:Literal>--%>
                                                    <wlb:CDropDownList ID="ddlBuyPoint" runat="server" hasOptionalItem="false" />
                                                    <asp:TextBox ID="txtRisk" runat="server" Wager='<%# Container.DataItem.TicketID%>'
                                                        Rate='<%# Container.DataItem.BetPoint%>' CssClass="textInput" MaxLength="10"
                                                        Style="text-align: right; padding-left: 2px; display: none;" Width="50" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <tr align="right">
                                        <asp:Literal ID="lblRiskWin" runat="server" Visible="false" />
                                    </tr>
                                    <tr style="text-align: left">
                                        <td colspan="3">
                                            <asp:Label ID="lblBetLimits" runat="server" Font-Bold="True" CssClass="label label-danger" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Literal ID="lblSperateStraight" runat="server"></asp:Literal>
                                <asp:Panel ID="pnOptionWager" runat="server" CssClass="row" Style="color: black;">
                                    <asp:Panel ID="noticeParlay" runat="server" Visible="false" CssClass="col-lg-4">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <wlb:CDropDownList ID="ddlType" runat="server" CssClass="form-control" hasOptionalItem="false" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtBetParlay" runat="server" Text='<%# IIf(SBCBL.std.SafeRound(Container.DataItem.RiskAmount)=0 , "",SBCBL.std.SafeRound(Container.DataItem.RiskAmount))%>'
                                                    CssClass="form-control" MaxLength="10" onkeypress="javascript:return inputNumber(this,event, false);" />
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <asp:Panel ID="noticeStraight" runat="server" Visible="false" CssClass="col-lg-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:RadioButton ID="rdRiskAmount" runat="server" GroupName="wager" Checked="true" onclick='showRisk(true)' />
                                                <asp:Label ID="lblRiskAmmount" runat="server" Text="Risk Amount"></asp:Label>
                                                <%--<asp:RadioButton ID="rdWinAmount" runat="server" GroupName="wager" onclick='showRisk(false)' /> To Win Amount --%>
                                                <asp:TextBox ID="txtBet" runat="server" Text='<%# IIf(SBCBL.std.SafeRound(Container.DataItem.RiskAmount)=0,"",SBCBL.std.SafeRound(Container.DataItem.RiskAmount))%>'
                                                    CssClass="form-control" Style="display: inline-block;" MaxLength="10" Width="90" onkeypress="javascript:return inputNumber(this,event, false);" />
                                                <asp:TextBox ID="txtWin" runat="server" Text='<%# IIf(SBCBL.std.SafeRound(Container.DataItem.WinAmount)=0,"",SBCBL.std.SafeRound(Container.DataItem.WinAmount))%>'
                                                    CssClass="form-control" Style="display: none;" MaxLength="10" Width="90" onkeypress="javascript:return inputNumber(this,event, false);" />
                                                <asp:Button ID="btnContinue" runat="server" Text="" CssClass="btn btn-dark" Style="margin-left: 10px;"
                                                    OnClick="btnPreview_Click" />
                                                <asp:Button ID="btnCancel" Visible="false" OnClick="btnClearWagers_Click" runat="server" Text="" Style="margin-left: 10px;" CssClass="btn btn-red"
                                                    ToolTip="Cancel Your Wager" />
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="lblRiskDsp" runat="server" Text="Bet: " Visible="false"></asp:Label>
                                            <%--<asp:TextBox ID="txtBet" runat="server" Text='<%# SBCBL.std.SafeRound(Container.DataItem.RiskAmount)%>'
                                        CssClass="textInput" MaxLength="10" Style="text-align: right; padding-left: 2px;"
                                        Width="50" onkeypress="javascript:return inputNumber(this,event, false);" />--%>
                                            <asp:Label ID="lblWinDsp" runat="server" Text="Win: " Visible="false"></asp:Label>
                                            <%-- <asp:TextBox ID="txtWin" runat="server" Text='<%# SBCBL.std.SafeRound(Container.DataItem.WinAmount)%>'
                                        CssClass="textInput" MaxLength="10" Style="text-align: right; padding-left: 2px;"
                                        Width="50" onkeypress="javascript:return inputNumber(this,event, false);" />--%>
                                            <asp:Label ID="lblResult" Style="display: none" runat="server" Text='<%# "Risk/Win: " & SBCBL.std.SafeRound(Container.DataItem.RiskAmount) & "/" & SBCBL.std.SafeRound(Container.DataItem.WinAmount) %>'></asp:Label>
                                            <asp:Button ID="btnNextWager" runat="server" Text="Continue" class="btn btn-dark" Style="margin-left: 10px;" OnClick="btnNextWager_Click" />
                                            <asp:Button ID="btnPreview" runat="server" Text="Continue" class="btn btn-dark" Style="margin-left: 10px;"
                                                OnClick="btnPreview_Click" />
                                            <asp:Button ID="btnCancel2" OnClick="btnClearWagers_Click" runat="server" Text="Cancel Wager" Style="margin-left: 10px;" CssClass="btn btn-red" ToolTip="Cancel Your Wager" />
                                        </div>
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>
                        <asp:Literal ID="tableEnd" runat="server"></asp:Literal>

                    </ItemTemplate>
                    <FooterTemplate>
                        <%#IIf((SBCBL.std.SafeString(Session("BetTypeActive")).Equals("Straight") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Equals("BetTheBoard") OrElse SBCBL.std.SafeString(Session("BetTypeActive")).Contains("If")), "</table> </td></tr></table>", "")%>
                    </FooterTemplate>
                </asp:Repeater>

                <tr>
                    <td>
                        <div id="tblBetTheboard" runat="server" visible="True" style="text-align: right;" class="row">
                            <span id="pnSameAmount" visible="false" runat="server" style="text-align: right; display: inline-block;">
                                <asp:CheckBox ID="chkCheckAmount" onclick="if(this.checked){$('.amount').hide()}else{$('.amount').show();$('.amount').val('');}" runat="server" />Use same amount for All Bets 
                                        <asp:TextBox ID="txtSameAmount" onkeypress="javascript:return inputNumber(this,event, false);" Width="100" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                <asp:Button ID="btnPreviewGame" runat="server" CssClass="btn btn-dark" Text="Preview Bet(s)" Style="margin-left: 10px;" />
                            </span>
                           
                            <asp:Label ID="lblMessage" Style="font-size: 14px; text-align: left; display: inline-block"
                                ForeColor="black" runat="server" Text="Please Enter Your Password To Confirm !"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" Visible="true" TextMode="Password"
                                Width="100" MaxLength="50" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                            <asp:Button ID="btnSubmit" runat="server" Visible="true" Text="Confirm Bet(s)" Style="margin-left: 10px;"
                                ToolTip="Confirm Bet(s)" CssClass="btn btn-dark" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel Your Wager" Style="margin-left: 10px; margin-right: 25px;" CssClass="btn btn-red"
                                ToolTip="Cancel Your Wager" />
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </td>
                </tr>
            </table>
        </div>

        <div>
            <%--<div style=" margin: 0px 7px 0px 0px;">--%>

            <div style="float: right">
                <div id="dvBtnWager" runat="server">
                    <asp:Button ID="btnNewWager" runat="server" Text="Add New Wager" CommandName="NEW_WAGER" />
                    <%--  <asp:Button ID="btnBackWager" runat="server" Visible="false" Text="Back To Wager"
                        Style="padding-left: 10px;" ToolTip="Back To Wager" />--%>
                </div>
                <div id="dvBtnReview" runat="server" style="text-align: right;">
                    <asp:Button ID="btnBack" runat="server" Visible="false" Text="Back" Style="padding-left: 10px;" ToolTip="Go Back To Your Wager Selection" />

                </div>
            </div>
            <%--</div>--%>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div id="noticeCancel" runat="server" style="text-align: center" visible="false">

    <font color="red" face="" size="4" style="BACKGROUND-COLOR: #ffffff">Current wager cancelled....</font>
    <br />
    <span style="color: black; font-size: 12pt">You may begin entering another wager by selecting a wager type above.</span>

</div>
