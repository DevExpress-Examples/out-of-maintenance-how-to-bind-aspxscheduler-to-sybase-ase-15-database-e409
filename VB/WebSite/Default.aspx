<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.1.Core, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="AppointmentDataSource"
			  OnAppointmentRowInserted="ASPxScheduler1_AppointmentRowInserted" OnAppointmentRowInserting="ASPxScheduler1_AppointmentRowInserting" OnAppointmentsInserted="ASPxScheduler1_AppointmentsInserted" GroupType="Resource" ResourceDataSourceID="ResourceDataSource" Start="2008-08-20">
			<Views>
				<DayView>
					<TimeRulers>
						<cc1:TimeRuler>
						</cc1:TimeRuler>
					</TimeRulers>
				</DayView>
				<WorkWeekView>
					<TimeRulers>
						<cc1:TimeRuler>
						</cc1:TimeRuler>
					</TimeRulers>
				</WorkWeekView>
				<TimelineView>
					<AppointmentDisplayOptions AppointmentAutoHeight="True" SnapToCellsMode="Never" />
				</TimelineView>
			</Views>
			<Storage>
				<Appointments>
					<Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="AppDescription" End="EndDate"
						Label="Label" Location="AppLocation" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo"
						ResourceId="ResourceID" Start="StartDate" Status="AppStatus" Subject="Subject"
						Type="AppType" />
				</Appointments>
				<Resources>
					<Mappings Caption="ResourceName" Color="Color" Image="Image" ResourceId="ID" />
				</Resources>
			</Storage>
		</dxwschs:ASPxScheduler>
		<asp:SqlDataSource ID="ResourceDataSource" runat="server" ConnectionString="Driver={Adaptive Server Enterprise};uid=sa;port=5000;server=SERVER;database=schedule;filedsn=sybase15.dsn"
			ProviderName="System.Data.Odbc" SelectCommand="SELECT * FROM [view_Res]">
		</asp:SqlDataSource>
		<asp:SqlDataSource ID="AppointmentDataSource" runat="server" ConnectionString="Driver={Adaptive Server Enterprise};uid=sa;port=5000;server=SERVER;database=schedule;filedsn=sybase15.dsn"
			ProviderName="System.Data.Odbc" 
			 DeleteCommand="DELETE FROM [view_Apps] WHERE [UniqueID] = @ID" 
			 InsertCommand="INSERT INTO [view_Apps] ([AppType], [StartDate], [EndDate], [AllDay], [Subject], [AppLocation], [AppDescription], [AppStatus], [Label], [ResourceID], [ReminderInfo], [RecurrenceInfo]) VALUES (@AppType, @StartDate, @EndDate, @AllDay, @Subject, @AppLocation, @AppDescription, @AppStatus, @Label, @ResourceID, @ReminderInfo, @RecurrenceInfo)" 
			 SelectCommand="SELECT [UniqueID], [AppType], [StartDate], [EndDate], [AllDay], [Subject], [AppLocation], [AppDescription], [AppStatus], [Label], [ResourceID], [ReminderInfo], [RecurrenceInfo] FROM [view_Apps]" 
			 UpdateCommand="UPDATE [view_Apps] SET [AppType]=@AppType, [StartDate]=@StartDate, [EndDate]=@EndDate, [AllDay]=@AllDay, [Subject]=@Subject, [AppLocation]=@AppLocation, [AppDescription]=@AppDescription, [AppStatus]=@AppStatus, [Label]=@Label, [ResourceID]=@ResourceID, [ReminderInfo]=@ReminderInfo, [RecurrenceInfo]=@RecurrenceInfo WHERE [UniqueID] = @UniqueID" OnInserted="SyBaseDataSource_Inserted" >
			<DeleteParameters>
				<asp:Parameter Name="UniqueID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="AppType" Type="Int32" />
				<asp:Parameter Name="StartDate" Type="DateTime" />
				<asp:Parameter Name="EndDate" Type="DateTime" />
				<asp:Parameter Name="AllDay" Type="Int32" />
				<asp:Parameter Name="Subject" Type="String" />
				<asp:Parameter Name="AppLocation" Type="String" />
				<asp:Parameter Name="AppDescription" Type="String" />
				<asp:Parameter Name="AppStatus" Type="Int32" />
				<asp:Parameter Name="Label" Type="Int32" />
				<asp:Parameter Name="ResourceId" Type="Int32" />
				<asp:Parameter Name="ReminderInfo" Type="String" /> 
				<asp:Parameter Name="RecurrenceInfo" Type="String" />
				<asp:Parameter Name="UniqueID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="AppType" Type="Int32" />
				<asp:Parameter Name="StartDate" Type="DateTime" />
				<asp:Parameter Name="EndDate" Type="DateTime" />
				<asp:Parameter Name="AllDay" Type="Int32" />
				<asp:Parameter Name="Subject" Type="String" />
				<asp:Parameter Name="AppLocation" Type="String" />
				<asp:Parameter Name="AppDescription" Type="String" />
				<asp:Parameter Name="AppStatus" Type="Int32" />
				<asp:Parameter Name="Label" Type="Int32" />
				<asp:Parameter Name="ResourceId" Type="Int32" />
				<asp:Parameter Name="ReminderInfo" Type="String" />
				<asp:Parameter Name="RecurrenceInfo" Type="String" />

			</InsertParameters>
		</asp:SqlDataSource>
		&nbsp;

	</div>
	</form>
</body>
</html>