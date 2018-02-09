create database CollegeSocial

use CollegeSocial

CREATE TABLE [dbo].[AdminLogin](
	[Username] [varchar](800) NULL,
	[Password] [varchar](800) NULL
)

CREATE TABLE [dbo].[AssignmentSubmission](
	[id] [varchar](80) NULL,
	[AssignmentId] [varchar](800) NULL,
	[UserId] [varchar](80) NULL,
	[Date] [varchar](80) NULL,
	[AFile] [varchar](800) NULL,
	[AStatus] [varchar](80) NULL
) 

CREATE TABLE [dbo].[DownloadEntry](
	[id] [varchar](20) NULL,
	[filename] [varchar](800) NULL,
	[filetype] [varchar](800) NULL,
	[filelocation] [varchar](800) NULL,
	[detail] [varchar](800) NULL
)

CREATE TABLE [dbo].[EventEntry](
	[id] [varchar](20) NULL,
	[eventname] [varchar](800) NULL,
	[location] [varchar](800) NULL,
	[startdate] [varchar](800) NULL,
	[enddate] [varchar](800) NULL,
	[detail] [varchar](800) NULL
)

CREATE TABLE [dbo].[ForumReply](
	[id] [varchar](80) NULL,
	[StudId] [varchar](800) NULL,
	[ForumId] [varchar](800) NULL,
	[Forum] [varchar](800) NULL,
	[Date] [varchar](800) NULL,
	[Reply] [varchar](800) NULL
) 

CREATE TABLE [dbo].[PlacementEntry](
	[id] [varchar](20) NULL,
	[companyname] [varchar](800) NULL,
	[position] [varchar](800) NULL,
	[location] [varchar](800) NULL,
	[vacancy] [varchar](800) NULL,
	[keyskill] [varchar](800) NULL,
	[startdate] [varchar](800) NULL,
	[enddate] [varchar](800) NULL,
	[detail] [varchar](800) NULL
)

CREATE TABLE [dbo].[StudDiscussion](
	[id] [varchar](20) NULL,
	[StudId] [varchar](20) NULL,
	[Date] [varchar](20) NULL,
	[Details] [varchar](800) NULL,
	[StudStatus] [varchar](80) NULL
) 

CREATE TABLE [dbo].[StudentProduct](
	[Id] [varchar](20) NULL,
	[StudID] [varchar](800) NULL,
	[PType] [varchar](800) NULL,
	[PName] [varchar](800) NULL,
	[PCost] [varchar](800) NULL,
	[Details] [varchar](800) NULL,
	[PStatus] [varchar](50) NULL
)

CREATE TABLE [dbo].[StudReg](
	[Id] [varchar](800) NULL,
	[StudName] [varchar](800) NULL,
	[StudAddress] [varchar](800) NULL,
	[StudMobile] [varchar](800) NULL,
	[StudMail] [varchar](800) NULL,
	[StudPassword] [varchar](800) NULL,
	[StudBranch] [varchar](800) NULL,
	[StudDiv] [varchar](800) NULL,
	[StudYear] [varchar](800) NULL,
	[StudGr] [varchar](800) NULL,
	[StudPhoto] [varchar](800) NULL,
	[StudStatus] [varchar](800) NULL
)

CREATE TABLE [dbo].[TeacherAnnouncement](
	[Id] [varchar](20) NULL,
	[info] [varchar](800) NULL,
	[AStatus] [varchar](50) NULL,
	[ADate] [varchar](20) NULL
)

CREATE TABLE [dbo].[TeacherAssignment](
	[Id] [varchar](20) NULL,
	[ASubject] [varchar](800) NULL,
	[AssignmentName] [varchar](800) NULL,
	[AssignmentDate] [varchar](800) NULL,
	[SubmissionDate] [varchar](800) NULL,
	[AssignmentMarks] [varchar](800) NULL,
	[ADesc] [varchar](800) NULL
)

CREATE TABLE [dbo].[TeacherReg](
	[id] [varchar](800) NULL,
	[teachername] [varchar](800) NULL,
	[teacheraddress] [varchar](800) NULL,
	[teachermobile] [varchar](800) NULL,
	[teachermail] [varchar](800) NULL,
	[teacherpassword] [varchar](800) NULL,
	[teacherDepartment] [varchar](800) NULL,
	[teacherDesignation] [varchar](800) NULL,
	[teacherphoto] [varchar](800) NULL,
	[teacherstatus] [varchar](800) NULL
)
