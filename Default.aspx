<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Default.aspx.vb" CodeFile="DefaultVB.aspx.vb" Inherits="Telerik.GridExamplesVBNET.DataBinding.ProgrammaticHierarchy.DefaultVB" %>

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
    <form id="form2" runat="server">
        <div style="background-color: black; padding: 15px">
            <h1 style="color: white;">GesTool4PI</h1>
            <%--<telerik:RadButton RenderMode="Lightweight" ID="Home" runat="server" Text="Home" OnClick="RadButtonHome_Click">
            </telerik:RadButton>--%>
        </div>
        <div>
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2"></telerik:RadScriptManager>
            <telerik:RadCodeBlock runat="server" ID="RadCodeBlock2">
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
                                transport.create.url = "https://605771a7055dbd0017e84cdc.mockapi.io/Equipment/";
                                break;

                            case "update":
                                transport.update.url = "https://605771a7055dbd0017e84cdc.mockapi.io/Equipment/" + updatedIDs.shift();
                                break;

                            case "destroy":
                                transport.destroy.url = "https://605771a7055dbd0017e84cdc.mockapi.io/Equipment/" + deletedIDs.shift();
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
                  
					function RowClick(sender, eventArgs) {
						var masterTable = sender.get_masterTableView();
						var item = masterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];
						var value = item.getDataKeyValue("id");
						window.location.href = "MonitorizationPoints.aspx?ID=" + value;
					}


				</script>
            </telerik:RadCodeBlock>
            <br />
            <br />
            <telerik:RadGrid AllowSorting="true" AllowPaging="true" runat="server" ID="RadGrid1" AutoGenerateColumns="false" RenderMode="Lightweight" Skin="Bootstrap" PageSize="7"
                ClientDataSourceID="RadClientDataSource2"  >
                <ClientSettings>
        <ClientEvents OnRowClick="RowClick" />
    </ClientSettings>
                <PagerStyle Mode="NumericPages"></PagerStyle>
                <MasterTableView EditMode="Batch" CommandItemDisplay="Top" ClientDataKeyNames="id" >
                    <Columns>
                        <telerik:GridEditCommandColumn HeaderText="Edit" UniqueName="EditCommandColumn" ButtonType="ImageButton" HeaderStyle-Width="70px" />
                        <telerik:GridBoundColumn UniqueName="id" DataField="id" HeaderText="id" ReadOnly="true" Visible="true"/>
                        <telerik:GridBoundColumn UniqueName="name" DataField="name" HeaderText="Name" />
                        <telerik:GridBoundColumn UniqueName="organization_id" DataField="organization_id" HeaderText="organization_id" ReadOnly="true" />
                        <telerik:GridTemplateColumn HeaderText="View" HeaderStyle-Width="3%" ColumnEditorID="teste" >
                            <ItemTemplate>
                                    <telerik:RadButton RenderMode="Lightweight" ID="imgBtn3" runat="server" Width="37px" Height="36px" OnClientClick="RowClick"  UseSubmitBehavior="false" OnClick="RadButtonView" >
                                    <Image ImageUrl="direito.png"></Image>
                                </telerik:RadButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridClientDeleteColumn HeaderText="Delete" ButtonType="ImageButton" HeaderStyle-Width="70px">
                        </telerik:GridClientDeleteColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <telerik:RadClientDataSource runat="server" ID="RadClientDataSource2">
                <ClientEvents OnCommand="dataSourceCommand" OnRequestStart="requestStart" />
                <DataSource>
                    <WebServiceDataSourceSettings>
                        <Select Url="http://localhost:5000/api/v1/organizations/10/equipments" RequestType="Get" />
                        <Insert Url="https://605771a7055dbd0017e84cdc.mockapi.io/Equipment" RequestType="Post" />
                        <Update Url="https://605771a7055dbd0017e84cdc.mockapi.io/Equipment" RequestType="Put" />
                        <Delete Url="https://605771a7055dbd0017e84cdc.mockapi.io/Equipment" RequestType="Delete" />
                    </WebServiceDataSourceSettings>
                </DataSource>
                <Schema>
                    <Model ID="id">
                        <telerik:ClientDataSourceModelField FieldName="id" />
                        <telerik:ClientDataSourceModelField FieldName="name" DataType="String" />
                        <telerik:ClientDataSourceModelField FieldName="organization_id" />
                    </Model>
                </Schema>
            </telerik:RadClientDataSource>

        </div>
    </form>

</body>
</html>
