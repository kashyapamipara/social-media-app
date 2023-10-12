class ApiUrls {
  static const String baseUrl = 'https://api.beta.payrollezy.gradlesol.com/';

  static const String loginApi = 'api/Auth/Login';
  static const String signUpApi = 'api/Auth/BusinessSignUp';
  static const String getAllEnumValuesApi = 'api/CommonApi/GetAllEnumValues';
  static const String addBusinessApi = 'api/Business/AddBusiness';
  static const String addPeopleApi = 'api/People/AddPeople';
  static const String getAllPeopleByFilterApi = 'api/People/GetAllPeopleByFilter';
  static const String getLocationListByBusinessIDApi = 'api/People/GetLocationListByBusinessId';
  static const String getLocationApi = 'api/Location/GetAllLocationByBusinessId';
  static const String getGeneralLocationSettingApi = 'api/Location/GetGeneralLocationSetting';
  static const String editGeneralLocationSettingApi = 'api/Location/EditGeneralLocationSetting';
  static const String deleteAreaApi = '/api/Location/DeleteArea';
  static const String addLocationApi = 'api/Location/AddLocation';
  static const String getLeaveRequestByPersonDetailIDApi = 'api/People/GetLeaveRequestByPersonDetailId';
  static const String getCurrentUserDataApi = 'api/People/GetCurrentUserData';
  static const String joinExistingTeamApi = 'api/People/JoinExistingTeam';
  static const String getLeaveRequestExtraDetailsApi = 'api/People/GetLeaveRequestExtraDetails';
  static const String getPeopleDetailsApi = 'api/People/GetPeopleDetails';
  static const String getPanelDetailsApi = 'api/Dashboard/GetPanelDetails';
  static const String getAreaDetailsApi = 'api/People/GetAreaDetails';
  static const String startShiftApi = 'api/Dashboard/StartShift';
  static const String addLeaveRequestApi = 'api/People/AddLeaveRequest';
  static const String editLeaveRequestApi = 'api/People/EditLeaveRequest';
  static const String getLeaveRequestByRequestIdApi = 'api/People/GetLeaveRequestByLeaveRequestId';
  static const String getLeaveEntitlementByPersonIdApi = 'api/People/GetLeaveEntitlementByPersonId';
  static const String forgotPasswordApi = 'api/Auth/ForgotPassword';
  static const String getPreviousShiftsApi = 'api/People/GetPreviousShifts';
  static const String getAreaListByLocationIdApi = 'api/Schedule/GetAreaListByLocationId';
  static const String addTimeSheetDetailsApi = 'api/TimeSheet/AddTimeSheetDetails';
  static const String editTimeSheetApi = 'api/TimeSheet/EditTimeSheet';
  static const String getTimeSheetByIdApi = 'api/TimeSheet/GetTimeSheetById';
  static const String editPeopleDetailsApi = 'api/People/EditPeopleDetails';
  static const String getAreaListByPersonApi = 'api/People/GetAreaListByPerson';
  static const String getUpcomingShiftListByPersonApi = 'api/Schedule/GetAllShiftForPerson';
  static const String getAllTimeSheetForPersonApi = 'api/TimeSheet/GetAllTimeSheetForPerson';
  static const String validateLinkApi = 'api/Auth/ValidateLink';
  static const String resetPasswordApi = 'api/Auth/ResetPassword';
  static const String getPersonListByBusinessIdApi = 'api/TimeSheet/GetPersonListByBusinessId';
  static const String getPeopleFilterByBusinessIdApi = 'api/People/GetPeopleFilterByBusinessId';
}