<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MonitorizationPoints.aspx.vb" CodeFile="MonitorizationPointsVB.aspx.vb" Inherits="Telerik.GridExamplesVBNET.DataBinding.ProgrammaticHierarchy.MonitorizationPointsVB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="getIdFromURL()">
    <style type="text.css">
        .teste{
            text-align: center;
        }
    </style>
    <form id="form3" runat="server">
        <div style="background-color: black; padding: 15px">
            <h1 style="color: white;">GesTool4PI</h1>
            <%--<telerik:RadButton RenderMode="Lightweight" ID="Home" runat="server" Text="Home" OnClick="RadButtonHome_Click">
            </telerik:RadButton>--%>
        </div>
        <div>
            <telerik:RadScriptManager runat="server" ID="RadScriptManager3"></telerik:RadScriptManager>
            <telerik:RadCodeBlock runat="server" ID="RadCodeBlock3">
                <script>

                    var updatedIDs = [], deletedIDs = [];

                    function requestStart(sender, args) {
                        var type = args.get_type();
                        var transport = sender.get_dataSourceObject().options.transport;
                        switch (type) {
                           <%-- case "read":
                                var textBox = $find('<%= RadNumericTextBox1.ClientID %>');
                                var value = textBox.get_value();
                                transport.read.url = "api/products/" + value;
                                break;--%>

                            case "create":
								transport.create.url = "https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint";
                                break;

                            case "update":
								transport.update.url = "https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint" + updatedIDs.shift();
                                break;

                            case "destroy":
								transport.destroy.url = "https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint" + deletedIDs.shift();
                                break;

                            default: break;
                        }
                    }
                    function btnClick(sender, args) {
                        var grid = $find('<%= RadGrid1.ClientID %>');
                        grid.get_masterTableView().rebind();
                    }

                    function dataSourceCommand(sender, args) {
                        var commandName = args.get_commandName();
                        var id = args.get_commandArgument().id;
                        switch (commandName) {
                            case "update":
                                updatedIDs.push(id);
                                break;

                            case "remove":
                                deletedIDs.push(id);
                                break;

                            default: break;
                        }
                    }
                    /*function rowClick(sender, args) {
						//button.set_autoPostBack(true);
						var item = args.get_item();
						var cell = item.get_cell("ID");
                        var value = $telerik.$(cell).text().trim();
                        //button.set_commandArgument(value)
						$.post('~/MonitorizationPoints.aspx?ID=' + id);
					}*/
                    //funçao de baixo funciona para dar grab ao id
					/*function RowClick(sender, eventArgs) {
						var masterTable = sender.get_masterTableView();
						var item = masterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                        var value = item.getDataKeyValue("ID");
                        alert("Click on row instance: " + eventArgs.get_itemIndexHierarchical() + " " + value);
                    }*/



                    function getIdFromURL() {
                        var url = (window.location).href;
						var id = url.substring(url.lastIndexOf('=') + 1);
                        
						alert("id grabbed " + id);
                        return id;
                    }


				</script>

                <script language="VB" runat="server">
                    Dim id As String = HttpContext.Current.Request.QueryString("id")
                    Dim getEndpoint = "http://localhost:5000/api/v1/equipments/" & id & "/monitorization-points"

                </script>
            </telerik:RadCodeBlock>
            <%-- <telerik:RadNumericTextBox runat="server" ID="RadNumericTextBox1" Label="Filter by ID: " LabelWidth="65px"></telerik:RadNumericTextBox>
            <telerik:RadButton AutoPostBack="false" runat="server" ID="RadButton1" Text="Filter" OnClientClicked="btnClick"></telerik:RadButton>--%>
            <br />
            <br />
            
            <telerik:RadGrid AllowSorting="true" AllowPaging="true" runat="server" ID="RadGrid1" AutoGenerateColumns="false" RenderMode="Lightweight" Skin="Bootstrap" PageSize="7"
                ClientDataSourceID="RadClientDataSource3" >
           
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView EditMode="Batch" CommandItemDisplay="Top" ClientDataKeyNames="ID" >
                    <Columns>
                        <telerik:GridEditCommandColumn HeaderText="Edit" UniqueName="EditCommandColumn" ButtonType="ImageButton" HeaderStyle-Width="70px" />
                        <telerik:GridBoundColumn UniqueName="ID" DataField="ID" HeaderText="ID" ReadOnly="true" Visible="true"/>
                        <telerik:GridBoundColumn UniqueName="equipment_id" DataField="equipment_id" HeaderText="equipment_id" ReadOnly="true" />
                        <telerik:GridBoundColumn UniqueName="Name" DataField="name" HeaderText="Name" />
                        <telerik:GridClientDeleteColumn HeaderText="Delete" ButtonType="ImageButton" HeaderStyle-Width="70px">
                        </telerik:GridClientDeleteColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <telerik:RadClientDataSource runat="server" ID="RadClientDataSource3" EnableServerFiltering="True">
                <ClientEvents OnCommand="dataSourceCommand" OnRequestStart="requestStart" />
                <DataSource>
                    <WebServiceDataSourceSettings>
                        <Select Url= '<%=getEndpoint%>' RequestType="Get" />
                        <Insert Url="https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint" RequestType="Post" />
                        <Update Url="https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint" RequestType="Put" />
                        <Delete Url="https://605771a7055dbd0017e84cdc.mockapi.io/MonitorizationPoint" RequestType="Delete" />
                    </WebServiceDataSourceSettings>
                </DataSource>
                <Schema>
                    <Model ID="ID">
                        <telerik:ClientDataSourceModelField FieldName="id" />
                        <telerik:ClientDataSourceModelField FieldName="equipment_id" />
                        <telerik:ClientDataSourceModelField FieldName="name" DataType="String" />
                    </Model>
                </Schema>
            </telerik:RadClientDataSource>

        </div>
    </form>

</body>
</html>
