Public Class _default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function Insertar(id As String, pnombre As String, snombre As String, papellido As String, sapellido As String, direccion As String,
                    ciudad As String, telefono As String, email As String)
        Dim cadena As String
        Dim cuenta As String
        Dim dtinsert As New DataTable
        dtinsert.Rows.Clear()
        cuenta = Day(Now).ToString & id.Substring(id.Length - 4, 4) & Year(Now).ToString
        cadena = ""
        cadena = "EXECUTE CRUDPERSON '" & id & "','" & pnombre & "','" & snombre & "','" & papellido & "','" & sapellido & "',
                   '" & direccion & "','" & ciudad & "','" & telefono & "','" & email & "','" & cuenta & "','ADMIN','INSERT'"

        Try
            dtinsert = consultaserver(dtinsert, cadena)
            Return 1
        Catch ex As Exception
            Return 0
        End Try
    End Function
End Class