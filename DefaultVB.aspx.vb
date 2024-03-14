Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Telerik.Web.UI
Imports Telerik
Namespace Telerik.GridExamplesVBNET.DataBinding.ProgrammaticHierarchy
    Partial Class DefaultVB
        Inherits System.Web.UI.Page

        Protected Sub RadButtonHome_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Response.Redirect("Default.aspx")
        End Sub

        'pode ser apagado radbuttonview e itemdatabound
        Protected Sub RadButtonView(ByVal sender As Object, ByVal e As System.EventArgs)
            'Dim item As GridDataItem = TryCast(e.Item, GridDataItem)'
            'Dim itemValue As String = item("ColumnUniqueName").Text '
            'For Each dataItem As GridDataItem In RadGrid1.Items
            '    dataItem = CType(e.Item, GridDataItem)
            '    Dim orderIdDataCell = dataItem("ID")
            '    Dim cellText = orderIdDataCell.Text
            '    Dim cellControl = TryCast(orderIdDataCell.Controls(0), ElasticButton)
            '    Dim cellControlText = cellControl.Text
            'Next

            'Dim cellValue As String
            'For Each dataItem As GridDataItem In RadGrid1.Items
            'cellValue = dataItem("ID").Text
            'Next
            'Dim dataItem As GridDataItem = RadGrid1.Items(1)
            Dim value As String
            For Each item As GridDataItem In RadGrid1.Items
                value = item("ID").Text
            Next
            'value = RadGrid1.MasterTableView.GetColumn("ID").ToString


            Response.Redirect("~/MonitorizationPoints.aspx?ID=" + value)

        End Sub



        Protected Sub RadGrid_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
            If TypeOf e.Item Is GridDataItem Then
                Dim item As GridDataItem = CType(e.Item, GridDataItem)
                Dim link As HyperLink = CType(item.FindControl("test"), HyperLink)
                Dim value As String = item.GetDataKeyValue("ID").ToString()
                link.NavigateUrl = "~/MonitorizationPoints.aspx?ID=" & value
            End If
        End Sub


    End Class
End Namespace

