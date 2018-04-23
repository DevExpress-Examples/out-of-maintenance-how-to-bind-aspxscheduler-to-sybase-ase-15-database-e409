Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.XtraScheduler
Imports DevExpress.Web.ASPxScheduler
Imports System.Data.Odbc

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private lastInsertedAppointmentId As Integer
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub ASPxScheduler1_AppointmentRowInserted(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs)
		e.KeyFieldValue = Me.lastInsertedAppointmentId
	End Sub
	Protected Sub ASPxScheduler1_AppointmentsInserted(ByVal sender As Object, ByVal e As DevExpress.XtraScheduler.PersistentObjectsEventArgs)
		Dim count As Integer = e.Objects.Count
		System.Diagnostics.Debug.Assert(count = 1)
		Dim apt As Appointment = CType(e.Objects(0), Appointment)
		Dim storage As ASPxSchedulerStorage = CType(sender, ASPxSchedulerStorage)
		storage.SetAppointmentId(apt, lastInsertedAppointmentId)
	End Sub
	Protected Sub SyBaseDataSource_Inserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
	   Dim connection As OdbcConnection = CType(e.Command.Connection, OdbcConnection)
		Using cmd As New OdbcCommand("SELECT @@identity", connection)
			Me.lastInsertedAppointmentId = Convert.ToInt32(cmd.ExecuteScalar())
		End Using
	End Sub
	Protected Sub ASPxScheduler1_AppointmentRowInserting(ByVal sender As Object, ByVal e As ASPxSchedulerDataInsertingEventArgs)
		e.NewValues.Remove("UniqueID")
	End Sub
End Class
