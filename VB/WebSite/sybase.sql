-----------------------------------------------------------------------------
-- DDL for Database 'schedule'
-----------------------------------------------------------------------------
print 'schedule'
go

use master
go

create database schedule on master = 5
go


-----------------------------------------------------------------------------
-- DDL for Table'schedule.dbo.Appointments'
-----------------------------------------------------------------------------
print 'Creating Table schedule.dbo.Appointments'
go 

use schedule
go 

setuser 'dbo'
go 

create table Appointments (
	AppType                         int                                  null  ,
	StartDate                       datetime                             null  ,
	EndDate                         datetime                             null  ,
	AllDay                          bit                              not null  ,
	Subject                         varchar(100)                         null  ,
	AppLocation                     varchar(50)                          null  ,
	AppDescription                  text                                 null  ,
	AppStatus                       int                                  null  ,
	Label                           int                                  null  ,
	ResourceID                      int                                  null  ,
	ReminderInfo                    text                                 null  ,
	RecurrenceInfo                  text                                 null  ,
	UniqueID                        numeric(4,0)                     identity  ,
 PRIMARY KEY CLUSTERED ( UniqueID )  on 'default' 
)
lock allpages
 on 'default'
partition by roundrobin(Appointments_576002052 on 'default') 
go 

sp_placeobject 'default', 'dbo.Appointments.tAppointments'
go 


setuser
go 

-----------------------------------------------------------------------------
-- DDL for Table'schedule.dbo.Resources'
-----------------------------------------------------------------------------
print 'Creating Table schedule.dbo.Resources'
go 

use schedule
go 

setuser 'dbo'
go 

create table Resources (
	ResourceName                    varchar(50)                          null  ,
	Color                           int                                  null  ,
	Image                           image                                null  ,
	ID                              int                              identity  ,
 PRIMARY KEY CLUSTERED ( ID )  on 'default' 
)
lock allpages
 on 'default'
partition by roundrobin(Resources_608002166 on 'default') 
go 

sp_placeobject 'default', 'dbo.Resources.tResources'
go 


setuser
go 

-----------------------------------------------------------------------------
-- DDL for View 'schedule.dbo.view_Apps'
-----------------------------------------------------------------------------
print 'Creating View view_Apps'
go 

use schedule
go 

setuser 'dbo'
go 


--Adaptive Server has expanded all '*' elements in the following statement
CREATE VIEW dbo.view_Apps AS SELECT dbo.Appointments.UniqueID, dbo.Appointments.AppType, dbo.Appointments.StartDate, dbo.Appointments.EndDate, dbo.Appointments.AllDay, dbo.Appointments.Subject, dbo.Appointments.AppLocation, dbo.Appointments.AppDescription, dbo.Appointments.AppStatus, dbo.Appointments.Label, dbo.Appointments.ResourceID, dbo.Appointments.ReminderInfo, dbo.Appointments.RecurrenceInfo FROM dbo.Appointments                                                                                                                            
go
setuser
go 

-----------------------------------------------------------------------------
-- DDL for View 'schedule.dbo.view_Res'
-----------------------------------------------------------------------------
print 'Creating View view_Res'
go 

use schedule
go 

setuser 'dbo'
go 


--Adaptive Server has expanded all '*' elements in the following statement
CREATE View view_Res
 
AS select dbo.Resources.ResourceName, dbo.Resources.Color, dbo.Resources.Image, dbo.Resources.ID
from dbo.Resources                                                                                                                                                      
go 

setuser
go 

------------------
insert into Resources
values ('Tomato',4678655,null)
go
insert into Resources
values ('Plum',14524637,null)
go
insert into Resources
values ('PeachPuff',12180223,null)
go
insert into Appointments
values (1,'2008-08-19 01:30:00.0','2008-08-19 02:30:00.0',0,'TEST','Here there everywhere',null,2,7,1,'<Reminders> <Reminder AlertTime="08/21/2008 01:15:00" /> </Reminders>','<RecurrenceInfo Start="08/19/2008 01:30:00" End="09/06/2008 01:30:00" Id="baaf1894-8012-44ed-90f5-ac3315cc912c" OccurrenceCount="10" Periodicity="2" />')
go

