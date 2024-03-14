<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Organizations.aspx.vb" Inherits="GesTool4PI.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style type="text.css">
        .teste{
            text-align: center;
        }
    </style>
    <form id="form1" runat="server">
        <div style="background-color: black; padding: 15px">
            <h1 style="color: white;">GesTool4PI</h1>
            <%--<telerik:RadButton RenderMode="Lightweight" ID="Home" runat="server" Text="Home" OnClick="RadButtonHome_Click">
            </telerik:RadButton>--%>
        </div>
        <div>
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1"></telerik:RadScriptManager>
            <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
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
                                transport.create.url = "http://localhost:5000/api/v1/organizations";
                                break;

                            case "update":
                                transport.update.url = "http://localhost:5000/api/v1/organizations/" + updatedIDs.shift();
                                break;

                            case "destroy":
                                transport.destroy.url = "http://localhost:5000/api/v1/organizations/" + deletedIDs.shift();
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

                 /*   function RowClick(sender, eventArgs) {
                        var masterTable = sender.get_masterTableView();
                        var item = masterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
                        var value = item.getDataKeyValue("ID");
                        window.location.href = "MonitorizationPoints.aspx?ID=" + value;
                    }
                    */

                </script>
            </telerik:RadCodeBlock>
            <%-- <telerik:RadNumericTextBox runat="server" ID="RadNumericTextBox1" Label="Filter by ID: " LabelWidth="65px"></telerik:RadNumericTextBox>
            <telerik:RadButton AutoPostBack="false" runat="server" ID="RadButton1" Text="Filter" OnClientClicked="btnClick"></telerik:RadButton>--%>
            <br />
            <br />
            <telerik:RadGrid AllowSorting="true" AllowPaging="true" runat="server" ID="RadGrid1" AutoGenerateColumns="false" RenderMode="Lightweight" Skin="Bootstrap" PageSize="7"
                ClientDataSourceID="RadClientDataSource1"  >
            <%--    <ClientSettings>
        <ClientEvents OnRowClick="RowClick" />
    </ClientSettings>--%>
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView EditMode="Batch" CommandItemDisplay="Top" ClientDataKeyNames="id" >
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="id" DataField="id" HeaderText="id" ReadOnly="true" Visible="true"/>
                        <telerik:GridBoundColumn UniqueName="address" DataField="address" HeaderText="address" />
                        <telerik:GridBoundColumn UniqueName="name" DataField="name" HeaderText="Name" />
                        <telerik:GridBoundColumn UniqueName="phone_number" DataField="phone_number" HeaderText="phone_number"  />
                        <telerik:GridEditCommandColumn HeaderText="Edit" UniqueName="EditCommandColumn" ButtonType="ImageButton" HeaderStyle-Width="70px" />
                        <telerik:GridClientDeleteColumn HeaderText="Delete" ButtonType="ImageButton" HeaderStyle-Width="70px">
                        </telerik:GridClientDeleteColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <telerik:RadClientDataSource runat="server" ID="RadClientDataSource1">
                <ClientEvents OnCommand="dataSourceCommand" OnRequestStart="requestStart" />
                <DataSource>
                    <WebServiceDataSourceSettings>
                        <Select Url="http://localhost:5000/api/v1/organizations" RequestType="Get" />
                        <Insert Url="http://localhost:5000/api/v1/organizations" RequestType="Post" />
                        <Update Url="http://localhost:5000/api/v1/organizations" RequestType="Put" />
                        <Delete Url="http://localhost:5000/api/v1/organizations" RequestType="Delete" />
                    </WebServiceDataSourceSettings>
                </DataSource>
                <Schema>
                    <Model ID="id">
                        <telerik:ClientDataSourceModelField FieldName="id" />
                        <telerik:ClientDataSourceModelField FieldName="address" DataType="String" />
                        <telerik:ClientDataSourceModelField FieldName="name" DataType="String" />
                        <telerik:ClientDataSourceModelField FieldName="phone_number" />
                    </Model>
                </Schema>
            </telerik:RadClientDataSource>

        </div>
    </form>

</body>
</html>
