﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PlayerBalanceReport.ascx.vb"
    Inherits="SBCWebsite.PlayerBalanceReport" %>
<%@ Register Src="~/Inc/PlayerEdit.ascx" TagName="PlayerEdit" TagPrefix="uc1" %>
<%@ Register Assembly="WebsiteLibrary" Namespace="WebsiteLibrary" TagPrefix="wlb" %>

<div id="tblPlayer" runat="server" class="panel panel-grey">
    <div class="panel-heading"><%=Title%></div>
    <div class="panel-body">
        <div id="trAgent" runat="server" class="form-group">
            <asp:Label ID="lblUsers" runat="server" class="control-label col-md-1"></asp:Label>
            <div class="col-md-9">
                <wlb:CDropDownList ID="ddlAgents" runat="server" CssClass="form-control" hasOptionalItem="false"
                    AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged" Width="220px" />
            </div>
        </div>
        <div id="trWeek" runat="server" class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Weeks" class="control-label col-md-1"></asp:Label>
            <div class="col-md-9">
                <wlb:CDropDownList ID="ddlWeeks" runat="server" CssClass="form-control" hasOptionalItem="false"
                    AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged" Width="220px" />
            </div>
        </div>

        <asp:DataGrid ID="dgSubPlayers" runat="server" Width="100%" AutoGenerateColumns="false" Font-Size="12px"
            CellPadding="2" CellSpacing="2" CssClass="table table-hover table-bordered table-striped">
            <HeaderStyle CssClass="tableheading" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" Wrap="false" />
            <AlternatingItemStyle HorizontalAlign="Left" Wrap="false" />
            <Columns>
                <asp:TemplateColumn HeaderText="Agent" ItemStyle-HorizontalAlign="Right" Visible="false" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:Label ID="lblAgent" runat="server" Text='<%# Container.DataItem("Agent")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Player">
                    <ItemTemplate>
                        <asp:Label ID="lblPlayer" runat="server" Text='<%# Container.DataItem("Player")%>'></asp:Label>
                        <asp:LinkButton ID="lbtEdit" ForeColor="Blue" CssClass="itemplayer" runat="server" CommandArgument='<%#Container.DataItem("PlayerID") %>' CommandName="EditUser" Text='Edit'></asp:LinkButton>
                        <br />
                        <asp:HyperLink ID="hlCreditBack" Style="font-size: 8pt; text-decoration: none" runat="server">Credit Back</asp:HyperLink>
                        <asp:HyperLink ID="hlHistoricalAmount" Style="text-decoration: none" runat="server" ToolTip="Statistical Report">Statistics</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateColumn>

                <asp:TemplateColumn HeaderText="Mon" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Mon"))<0,"red","blue") %>'>
                            <asp:Label ID="lblMon" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Mon")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tues" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Tues"))<0,"red","blue") %>'>
                            <asp:Label ID="lblTues" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Tues")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Wed" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Wed"))<0,"red","blue") %>'>
                            <asp:Label ID="lblWed" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Wed")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Thurs" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Thurs"))<0,"red","blue") %>'>
                            <asp:Label ID="lblThurs" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Thurs")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Fri" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Fri"))<0,"red","blue") %>'>
                            <asp:Label ID="lblFri" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Fri")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Sat" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Sat"))<0,"red","blue") %>'>
                            <asp:Label ID="lblSat" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Sat")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Sun" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Sun"))<0,"red","blue") %>'>
                            <asp:Label ID="lblSun" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Sun")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Gross" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Gross"))<0,"red","blue") %>'>
                            <asp:Label ID="lblGross" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Gross")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Net" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px" Visible="false">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("Net"))<0,"red","blue") %>'>
                            <asp:Label ID="lblNet" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Net")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="P/L" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <span style='color: <%# IIf(SBCBL.std.SafeDouble(Container.DataItem("PL"))<0,"red","blue") %>'>
                            <asp:Label ID="lblPL" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("PL")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                        </span>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Pending" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <asp:Label ID="lblPending" runat="server" Text='<%# FormatNumber(SBCBL.std.SafeDouble(Container.DataItem("Pending")), SBCBL.std.GetRoundMidPoint) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
         <div id="trChart" runat="server" class="form-group">
             <div class="col-md-12">
                 <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="/FusionCharts_Enterprise/swflash.cab"
                width="350" height="250" id="chart1">
                <param name="movie" value="/FusionCharts_Enterprise/Charts/MSLine.swf" />
                <%="<param name=""FlashVars"" value=""&dataXML="%><asp:Literal ID="lblXML1" runat="server"></asp:Literal>
                <%="""/>"%>
                <param name="wmode" value="opaque" />
                <param name="quality" value="high" />
                <embed src="/FusionCharts_Enterprise/Charts/MSLine.swf" flashvars="&dataXML=<%= lblXML1.Text%>"
                    quality="high" bgcolor="#ffffff" wmode="opaque" width="350" height="250" name="MSLine"
                    align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
            </object>
             </div>
         </div>
    </div>
</div>


<div style="margin-left: 10px; margin-top: 10px" id="PlayerEdit" runat="server" visible="false">
    <uc1:PlayerEdit ID="ucPlayerEdit" runat="server" />
</div>
