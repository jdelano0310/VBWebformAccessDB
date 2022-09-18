Imports System.Data.OleDb

Public Class Contact
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim currentMode As String = Request.QueryString("mode")
            lblJobCRUDMode.Text = "Current mode is " + currentMode
        End If

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim SQL As String
        Select Case Request.QueryString("mode")
            Case "Add"
                SQL = "Insert Into Jobs (JobName, StartDate, EndDate, Comments) values " &
                      "('" & txtJobName.Text & "',#" & txtStartDate.Text & "#,#" & txtEndDate.Text &
                      "#,'" & txtComments.Text & "')"

                If ExecuteQueryDB(SQL) Then
                    lblSaveResult.Text = "Job saved successfully"
                Else
                    lblSaveResult.Text = "UNABLE TO SAVE"
                End If
            Case "Edit"

            Case "Delete"
        End Select

    End Sub

    Protected Function dbCon() As OleDbConnection

        ' open a connection to the database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cStr").ConnectionString
        cn.Open()

        Return cn

    End Function

    Protected Function ExecuteQueryDB(ByVal SQL As String) As Boolean

        ' run the passed query and return the data
        Dim result As Int16 = 0
        Dim cn As OleDbConnection = dbCon()
        Dim cmd As OleDbCommand

        Try
            cmd = New OleDbCommand(SQL, cn)
            result = cmd.ExecuteNonQuery()

        Catch ex As Exception

        Finally

            If result > 0 Then cmd.Dispose()
            cn.Close()

        End Try


        Return result > 0

    End Function
End Class