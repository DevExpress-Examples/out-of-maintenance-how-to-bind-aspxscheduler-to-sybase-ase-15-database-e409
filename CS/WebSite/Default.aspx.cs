using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.XtraScheduler;
using DevExpress.Web.ASPxScheduler;
using System.Data.Odbc;

public partial class _Default : System.Web.UI.Page {
    int lastInsertedAppointmentId;
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void ASPxScheduler1_AppointmentRowInserted(object sender, DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs e) {
        e.KeyFieldValue = this.lastInsertedAppointmentId;
    }
    protected void ASPxScheduler1_AppointmentsInserted(object sender, DevExpress.XtraScheduler.PersistentObjectsEventArgs e) {
        int count = e.Objects.Count;
        System.Diagnostics.Debug.Assert(count == 1);
        Appointment apt = (Appointment)e.Objects[0];
        ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        storage.SetAppointmentId(apt, lastInsertedAppointmentId);
    }
    protected void SyBaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e) {
       OdbcConnection connection = (OdbcConnection)e.Command.Connection;
        using (OdbcCommand cmd = new OdbcCommand("SELECT @@identity", connection)) {
            this.lastInsertedAppointmentId = Convert.ToInt32(cmd.ExecuteScalar());
        }
    }
    protected void ASPxScheduler1_AppointmentRowInserting(object sender, ASPxSchedulerDataInsertingEventArgs e) {
        e.NewValues.Remove("UniqueID");
    }
}
