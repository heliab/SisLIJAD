
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
    fn_CleanGroup(1);
    FormPopup.Show();
}

function fn_EditJS() {
    HiddenV.Set('Nuevo', 1);
    HiddenV.Set('Save', 0);
    fn_GetIdValue();
    //alert('despues de get id value'+GridId);
    FillingCallback.PerformCallback();
    //alert('Despues del callback');
    FormPopup.Show();


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
/* **********************************Funciones Grid************************************* */
function fn_GetIdValue() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    //HiddenV.Set("GridId", GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex()));
   txtId.SetText(GridId);
    return GridId;
}

function fn_GetIdValue2() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    document.getElementById('txtId2').value = GridId;
    document.getElementById('btnUpdate').click();
}

function fn_EndBinding() { 


}
/***********************************Funciones SubGrid**************************************/
function fn_GetSubIdValue() {
    SubGridId = SubGrid.GetRowKey(SubGrid.GetFocusedRowIndex());
    txtIdSub.SetText(SubGridId);
    return SubGridId;
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
fn_CleanGroup1();
FormPopup.Show();
}

function fn_SubNew() {
    fn_GetSubIdValue();
    fn_CleanGroup2();
    SubForm.Show();

}
// *************************************Funciones Editar ******************************************
function fn_Select() {
//    if (fn_GetIdValue() == null)
//    { alert("Debe seleccionar un registro!"); }
//    else {
//        HiddenV.Set('Nuevo', 1);
//        FillCallback.PerformCallBack()
//        FormPopup.Show();
    //    }

}
// *************************************Funciones Borrar ******************************************
function fn_ShowDelete() {
    GridId = GridPrincipal.GetRowKey(GridPrincipal.GetFocusedRowIndex());
    txtIdD.SetText(GridId);
    DeleteForm.Show();
}


/* **************************************Funciones popup **************************************   */
function fn_ClosePopup(e) {
    //0 Valida el formy}ulario cuando se cierra el popup con cancelar
    switch (e) {
        case 0:
            
            FormPopup.Hide();
            fn_GetIdValue();
            fn_CleanGroup(1);
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
            fn_Validate(1);
            SubForm.Hide();
            break;
            //Cerrar popup Subform y limpiar datos, en vez de Opoup client side events
            //Botón Cancelar del subform
        case 5:
           // fn_CleanGroup2();
            SubForm.Hide();

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