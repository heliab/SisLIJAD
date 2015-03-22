
function fn_Editar() {
    fn_GetIdValue();
    HiddenV.Set('Nuevo', 1);
   FormPopup.Show();
 }

function fn_Nuevo() {
    txtId.SetText('Nuevo');
    HiddenV.Set('Nuevo', 0);
    fn_CleanGroup(1);
    FormPopup.Show();
 }


/************************ Callbacks js functions *********************************/
 function fn_NewJS() {
    txtId.SetText('Nuevo');
    HiddenV.Set('Nuevo', 0);
    FormPopup.Show();
    fn_CleanGroup(1);
}


function fn_EditJS() {

    if (fn_GetIdValue() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        HiddenV.Set('Nuevo', 1);
        fn_GetIdValue();
        FillingCallback.PerformCallback();
        FormPopup.Show();
    }

}
function fn_SaveJS() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
        retutn;
    }
    NewCallback.PerformCallback();
    fn_CleanGroup(1);
    GridPrincipal.PerformCallback();
    FormPopup.Hide();
}

function fn_DeleteJS() {
    if (fn_GetIdValue() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        HiddenV.Set('Nuevo', 2);
        fn_ShowDelete();
    }
 }
function fn_ConfirmDJS() {
    NewCallback.PerformCallback();
    fn_EndCallback();
     fn_ClosePopup(2);

}
function fn_CancelDJS() {
    fn_ClosePopup(2);
}
function fn_CancelJS() {
    fn_ClosePopup(0);
}
function fn_EndCallback(s, e) {
    GridPrincipal.PerformCallback();
}
function GetAprobRow() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Aprobado', SetAprob);
    function SetAprob(Value) {
        if (Value == 1) {
            alert('El registro ya ha sido aprobado y no puede realizar cambios');
            return
        }
        else { fn_AprobarJS(); }
    }
}

function fn_AprobarJS() {
    if (confirm("¿Desea aprobar el registro?\nEl proceso no tiene retroceso!")) {
        HiddenV.Set('Nuevo', 6);
        HiddenV.Set('Aprobar', fn_GetIdValue());
        NewCallback.PerformCallback();
        fn_EndCallback();
    }
 }
/****** Sub Functions for Subforms***/
function fn_SubNewJS() {
    HiddenV.Set("Session", fn_GetIdValue());
    txtSubId.SetText('Nuevo');
    HiddenV.Set('Nuevo', 3);
    SubFormPopup.Show();
    fn_CleanGroup(2);

}

function fn_SubEditJS() {
    HiddenV.Set("Session", fn_GetIdValue());
    if (fn_GetSubIdValue() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        HiddenV.Set('Nuevo', 4);
        fn_GetSubIdValue();
        SubFillingCallback.PerformCallback();
        SubFormPopup.Show();
    }

}
function fn_SubSaveJS() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup2')) {
        retutn;
    }
    NewCallback.PerformCallback();
    fn_CleanGroup(2);
    GridPrincipal.PerformCallback();
    SubFormPopup.Hide();
}
function fn_SubAdd() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup2')) {
        retutn;
    }
    NewCallback.PerformCallback();
    fn_CleanGroup(2);
    GridPrincipal.PerformCallback();
 }
function fn_SubDeleteJS() {
    HiddenV.Set('Nuevo', 5);
      fn_ShowSubDelete();
}
function fn_SubConfirmDJS() {
    DelCallback.PerformCallback();
    fn_EndCallback();
    fn_ClosePopup(2);

}
function fn_SubCancelDJS() {
    fn_ClosePopup(2);
}
function fn_SubCancelJS() {
    fn_ClosePopup(5);
}

/*SubForm2**/
function fn_SubNew2JS() {
    HiddenV.Set("Session", fn_GetIdValue());
    txtSubId2.SetText('Nuevo');
    HiddenV.Set('Nuevo', 10);
    SubFormPopup2.Show();
    fn_CleanGroup(3);

}

function fn_SubEdit2JS() {
    HiddenV.Set("Session", fn_GetIdValue());
    if (fn_GetSubIdValue2() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        HiddenV.Set('Nuevo', 11);
        fn_GetSubIdValue2();
        SubFillingCallback2.PerformCallback();
        SubFormPopup2.Show();
    }

}
function fn_SubSave2JS() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup3')) {
        retutn;
    }
    NewCallback.PerformCallback();
    fn_CleanGroup(3);
    GridPrincipal.PerformCallback();
    SubFormPopup2.Hide();
}
function fn_SubAdd2() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup3')) {
        retutn;
    }
    NewCallback.PerformCallback();
    fn_CleanGroup(3);
    GridPrincipal.PerformCallback();
}
function fn_SubDelete2JS() {
    HiddenV.Set('Nuevo', 12);
    fn_ShowSubDelete2();
}
function fn_SubConfirmD2JS() {
    DelCallback.PerformCallback();
    GridPrincipal.PerformCallback();
    fn_ClosePopup(2);

}
function fn_SubCancelD2JS() {
    fn_ClosePopup(2);
}
function fn_SubCancel2JS() {
    fn_ClosePopup(2);
}
/* **********************************Funciones Grid************************************* */
function fn_GetIdValue() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    //HiddenV.Set("GridId", GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
   txtId.SetText(GridId);
    return GridId;
}

function fn_GetIdValueN() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    document.getElementById('txtId2').value = GridId;
    document.getElementById('btnUpdate').click();
}
/***********************************Funciones SubGrid**************************************/
function fn_GetSubIdValue() {
    SubGridId = SubGrid.GetRowKey(SubGrid.GetFocusedRowIndex());
    txtSubId.SetText(SubGridId);
    return SubGridId;
}
function fn_GetSubIdValue2() {
    SubGridId2 = SubGrid2.GetRowKey(SubGrid2.GetFocusedRowIndex());
    txtSubId2.SetText(SubGridId2);
    return SubGridId2;
    
}


/* *******************************Funciones Mensajes ************************************ */
function fn_PrintValue(GridId) {
    alert(GridId);
}

function fn_ShowMessage() {
    alert('Working over here');
}

function fn_CallUpdate() {
    fn_ShowMessage();
    document.getElementById('btnUpdate').click();

}

//****************************************Funciones Nuevo******************************************
function fn_New() {
    
       HiddenV.Set('Nuevo', 0);
    txtId.SetText('Nuevo');
fn_CleanGroup(1);
FormPopup.Show();
fn_CleanGroup1();
}


// *************************************Funciones Borrar ******************************************
function fn_ShowDelete() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    txtIdD.SetText(GridId);
    DeleteForm.Show();
}
function fn_ShowSubDelete() {
    if (fn_GetSubIdValue() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        SubGridId = SubGrid.GetRowKey(SubGrid.GetFocusedRowIndex());
        txtIdD.SetText(SubGridId);
        DeleteForm.Show();
    }
}
function fn_ShowSubDelete2() {
    if (fn_GetSubIdValue2() == null) {
        alert('Debe seleciconar un registro!');
    }
    else {
        SubGridId2 = SubGrid2.GetRowKey(SubGrid2.GetFocusedRowIndex());
        txtIdD.SetText(SubGridId2);
        DeleteForm.Show();
    }
}

/* **************************************Funciones popup **************************************   */
function fn_ClosePopup(e) {
    //0 Valida el formy}ulario cuando se cierra el popup con cancelar
    switch (e) {
        case 0:

            FormPopup.Hide();
            fn_CleanGroup(1);
            HiddenV.Clear();
            break;
        //1 Cuando se guardan los datos
        case 1:
            FormPopup.Hide();
          
            break;
            //    fn_CleanGroup2();
            
        //2 Cuando se va a cerrar el popup de eliminar
        case 2:
            DeleteForm.Hide();
            break;
            //GridPrincipal.Focus(GridPrincipal.focusedRowIndex);  ver si esto ocasiona problemas
            //3 Al guardar subformulario
        case 3:
            SubFormPopup2.Hide();
            break;
        case 5:
            fn_CleanGroup(2);
            SubFormPopup.Hide();

            break;
            
        default:
            FormPopup.Hide();
    }

}


/* ********************************* Funciones Validar Grupos *********************************** */
function fn_CleanGroup(e) {
    switch (e) {
        case 1: ASPxClientEdit.ClearGroup('ControlGroup1');
            break;
        case 2: ASPxClientEdit.ClearGroup('ControlGroup2');
            break;
        case 3: ASPxClientEdit.ClearGroup('ControlGroup3');
            break;
        default: ASPxClientEdit.ClearGroup('ControlGroup1');
            break;
    }
   
}
function fn_CleanGroup1() { 
ASPxClientEdit.ClearGroup('ControlGroup1');
}

function fn_CleanGroup2() {
    ASPxClientEdit.ClearGroup('ControlGroup2');
}

function fn_Validate(e) {
    switch (e) {
        case 0: if (!ASPxClientEdit.ValidateGroup('ControlGroup1'))
                return;
            break;
        case 1: if (!ASPxClientEdit.ValidateGroup('ControlGroup2'))
                return;
            break;
        default: fn_ClosePopup(1);
    }
    
   
}



//function fn_CleanIdText() {
//    if (txtId.Text != null) {
//        txtId.SetText('Nuevo');
//        alert('Hey here');
//    }
//    else {
//        alert('The text is null');
//    } 
//}
