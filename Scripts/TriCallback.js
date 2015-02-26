/*    ************************************Complete JS functions  they work perfectly with lab2.aspx page
function fn_NewJS() {
txtId.SetText('Nuevo');
HiddenV.Set('Nuevo', 0);
fn_CleanGroup(1);
FormPopup.Show();
}

function fn_EditJS() {

if (fn_GetIdValue == null) {
alert('Debe seleciconar un registro');
}
else {
HiddenV.Set('Nuevo', 1);
HiddenV.Set('Save', 0);
fn_GetIdValue();
//alert('despues de get id value'+GridId);
FillingCallback.PerformCallback();
//alert('Despues del callback');
FormPopup.Show();
}

}
function fn_SaveJS() {
if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
retutn;
}
fn_ShowMessage();
HiddenV.Set('Save',1);
// FillingCallback.PerformCallback();
NewCallback.PerformCallback();
fn_CleanGroup1();
GridPrincipal.PerformCallback();
FormPopup.Hide();

//    alert('After perform callback');
}

function fn_DeleteJS() {
fn_ShowDelete();
}
function fn_ConfirmDJS() {
DelCallback.PerformCallback();
fn_EndCallback();
fn_ClosePopup(2);

}
function fn_CancelDJS() {
fn_ClosePopup(2);
}
function fn_CancelJS() {
fn_ClosePopup(1);
}
function fn_EndCallback(){
GridPrincipal.PerformCallback();
}






*/