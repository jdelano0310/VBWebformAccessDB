Imports System.Data.OleDb
Imports System.Configuration
Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            ' this only runs the first time the page is loaded
            FillJobsDropdown()
            drpJobs_SelectedIndexChanged(sender, e)
        End If

    End Sub

    Protected Function dbCon() As OleDbConnection

        ' open a connection to the database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cStr").ConnectionString
        cn.Open()

        Return cn

    End Function
    Protected Function QueryDB(ByVal SQL As String) As DataTable

        ' run the passed query and return the data
        Dim cn As OleDbConnection = dbCon()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter(SQL, cn)

        Dim table As New DataTable
        da.Fill(table)

        da.Dispose()
        cn.Close()

        Return table

    End Function

    Protected Sub FillJobsDropdown()

        Dim tblJobs As DataTable = QueryDB("Select Id, JobName from Jobs order by Jobname")

        drpJobs.DataSource = tblJobs
        drpJobs.DataTextField = "JobName"
        drpJobs.DataValueField = "Id"
        drpJobs.DataBind()

        tblJobs = Nothing

    End Sub

    Protected Sub DisplayJobData(ByVal JobID As String)

        Dim SQL As String

        ' get the item records for the selected job
        SQL = "SELECT JobItems.ItemName, JobItems.ItemDescription, JobItems.DateAssigned FROM Jobs INNER JOIN JobItems ON Jobs.ID =  JobItems.JobID where Jobs.ID = " + JobID

        Dim tblJobItems As DataTable = QueryDB(SQL)
        grdJobitems.DataSource = tblJobItems
        grdJobitems.DataBind()

        ' get the other job information
        SQL = "SELECT Comments, StartDate, EndDate FROM Jobs Where ID = " + JobID

        Dim tblJobInfo As DataTable = QueryDB(SQL)
        txtcomments.Text = tblJobInfo.Rows(0).Item("Comments") + ""   ' adding the blank at the end prevents null issues
        txtStartDate.Text = tblJobInfo.Rows(0).Item("StartDate")
        txtEndDate.Text = tblJobInfo.Rows(0).Item("EndDate")

        tblJobItems = Nothing
        tblJobInfo = Nothing

    End Sub
    Protected Sub drpJobs_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpJobs.SelectedIndexChanged

        ' look up specific data for the selected job
        DisplayJobData(drpJobs.SelectedItem.Value)
    End Sub
End Class