
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
function fn_GetMail() {
    GridPrincipal.GetRowValues(GridPrincipal.GetFocusedRowIndex(), 'Email', SetEmail);
    function SetEmail(Value) {
        txtMail.SetText(Value);
    }
}
function fn_SendSolJS() {
    HiddenV.Set('Nuevo', 7);
    HiddenV.Set('EnvioId', fn_GetIdValue());
    NewCallback.PerformCallback();
    fn_EndCallback();
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
    HiddenV.Set('Nuevo', 3);
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
    fn_ClosePopup(3);
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
function fn_GetGridResIdValue() {
    ResGridId = GridResultados.GetRowKey(GridResultados.GetFocusedRowIndex());
    txtId.SetText(ResGridId);
    return ResGridId;
}

function fn_GetGridResIdValue2() {
    ResGridId2 = GridResultados2.GetRowKey(GridResultados2.GetFocusedRowIndex());
    txtId2.SetText(ResGridId2);
    return ResGridId2;
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
function fn_ShowDeleteTestJS() {
    if (fn_GetGridResIdValue() == null) {
        alert('Debe seleciconar un registro!');
    }
    else {
        ResGridId = GridResultados.GetRowKey(GridResultados.GetFocusedRowIndex());
        txtIdD.SetText(ResGridId);
        DeleteForm.Show();
    }
}
function fn_ShowDeleteTestJS2() {
    if (fn_GetGridResIdValue2() == null) {
        alert('Debe seleciconar un registro!');
    }
    else {
        ResGridId2 = GridResultados2.GetRowKey(GridResultados2.GetFocusedRowIndex());
        txtIdD.SetText(ResGridId2);
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
        case -1: ASPxClientEdit.ClearGroup('ControlGroupR');
            break;
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
        case -1: if (!ASPxClientEdit.ValidateGroup('ControlGroupR'))
                return;
            break;
        default: fn_ClosePopup(1);
    }
    
   
}
function fn_MostrarCredito() { alert("SISLIJAD Creado por Haniel Lopez")}
/************************* Funciones prueba *************************/
function fn_NewMainTest() {
    txtId.SetText('Nuevo Calculo');
    HiddenV.Set('Fill', 1); //0 es para editar //El resto para pruebas
    HiddenV.Set('Nuevo', 0)
    FormPopup.Show();
    fn_CleanGroup(1);
    fn_CleanGroup(-1);
  }
  function fn_SaveTestJS() {
      if (!ASPxClientEdit.ValidateGroup('ControlGroupR')) {
          retutn;
      }
      if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
          retutn;
      }
           
        NewCallback.PerformCallback();
        fn_CleanTestPopup(1);
        GridResultados.PerformCallback();
        FormPopup.Hide();
  }
  function fn_CalcJS() {
      if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
          retutn;
      }
     
          HiddenV.Set('Fill', 1);
          FillingCallback.PerformCallback();
      
  }
  function fn_CleanTestPopup(e) {
      switch (e) {
          case 1: fn_CleanGroup(0);//En caso sea el primer popup de la primera prueba
              fn_CleanGroup(-1);
              break;
          default: fn_CleanGroup(0);
              break;
      }
  }
  
  function fn_EditTestJS() {

      if (fn_GetGridResIdValue() == null) {
          alert('Debe seleciconar un registro');
      }
      else {
          HiddenV.Set('Nuevo', 1);
          HiddenV.Set('Fill', 0);
          FillingCallback.PerformCallback();
          FormPopup.Show();
      }

  }
  function fn_CancelTestJS() {
      fn_CleanGroup(-1);
      fn_CleanGroup(0);
      FormPopup.Hide();
  }
  function fn_DeleteTestJS() {
      HiddenV.Set('Nuevo', 2);
      fn_ShowDeleteTestJS();
  }
 function fn_ConfirmResDJS() {
  NewCallback.PerformCallback();
  GridResultados.PerformCallback();
  fn_ClosePopup(2);
}

//Funciones 2
function fn_NewMainTest2() {
    txtId2.SetText('Nuevo Calculo');
    HiddenV.Set('Fill', 1); //0 es para editar //El resto para pruebas
    HiddenV.Set('Nuevo', 3)
    FormPopup2.Show();
    fn_CleanGroup(1);
    fn_CleanGroup(-1);
}
function fn_SaveTestJS2() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroupR')) {
        retutn;
    }
    if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
        retutn;
    }
    NewCallback.PerformCallback();
    GridResultados2.PerformCallback();
    fn_CleanTestPopup(1);
    FormPopup2.Hide();
}
function fn_CalcJS2() {
    if (!ASPxClientEdit.ValidateGroup('ControlGroup1')) {
        retutn;
    }

    HiddenV.Set('Fill', 1);
    FillingCallback2.PerformCallback();

}
function fn_CleanTestPopup(e) {
    switch (e) {
        case 1: fn_CleanGroup(0); //En caso sea el primer popup de la primera prueba
            fn_CleanGroup(-1);
            break;
        default: fn_CleanGroup(0);
            break;
    }
}

function fn_EditTestJS2() {

    if (fn_GetGridResIdValue2() == null) {
        alert('Debe seleciconar un registro');
    }
    else {
        HiddenV.Set('Nuevo', 4);
        HiddenV.Set('Fill', 0);
        FillingCallback2.PerformCallback();
        FormPopup2.Show();
    }

}
function fn_CancelTestJS() {
    fn_CleanGroup(-1);
    fn_CleanGroup(0);
    FormPopup.Hide();
}
function fn_DeleteTestJS2() {
    HiddenV.Set('Nuevo', 5);
    fn_ShowDeleteTestJS2();
}
function fn_ConfirmDJS2() {
    NewCallback.PerformCallback();
    GridResultados2.PerformCallback();
    GridResultados.PerformCallback();
    fn_ClosePopup(2);
}
function fn_CancelTest2JS() {

    fn_CleanGroup(-1);
    fn_CleanGroup(0);
    FormPopup2.Hide();
}

function fn_EndCallbackForTest() {
    GridResultados.PerformCallback();
}
function fn_ConfirmTestDJS() {
    NewCallback.PerformCallback();
    GridResultados.PerformCallback();
    fn_ClosePopup(2);
}

/****Funtions for reports***/
function fn_ShowWindowReport(e) { 
switch(e){
    case 1: window.open("http://www.w3schools.com", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=400, height=400");
//    window.location.href = "/Clientes/Results/PesoVolumetricoSecoSueltoRes.aspx?Id=" + val[0] + "&Sol=" + fn_GetIdPrValue() + "&Pr=" + val[1];
        break;
}
}
function fn_VerMaterialesJS() {
    SubGridId = SubGrid.GetRowKey(SubGrid.GetFocusedRowIndex());
    window.location.href = "/Clientes/Reportes/Rpt_MaterialesRequeridos.aspx?Id="+SubGridId;
}
function fn_IrChecklist() {
    SubGrid.GetRowValues(SubGrid.GetFocusedRowIndex(), 'IdPrueba', GetPrValues);
    function GetPrValues(Val) {
        window.location.href = "/Tecnicos/Reportes/Rpt_MaterialesReq.aspx?Id=" + Val; 
    
    }
}
function fn_IrEqChecklist() { 
SubGrid.GetRowValues(SubGrid.GetFocusedRowIndex(), 'IdPrueba', GetPrValues);
    function GetPrValues(Val) {
        window.location.href = "/Tecnicos/Reportes/Rpt_EquipReq.aspx?Id=" + Val; 
    }
}
/*Funciones pantalla de edicion de perfil*/
function fn_ChangeProfileJS() {
    FillingCallback.PerformCallback();
    FormPopup.Show();
}
function fn_SaveProfileJS() {
    NewCallback.PerformCallback();
    fn_ClosePopup(1);
}
/***** Sweet alert******/
function fn_Welcome() {
    swal("Bienvenido!", "Por favor completa tu perfil! De esta manera sabremos más de ti", "success")

    swal({
        title: "Bienvenido?",
        text: "Por favor completa tu perfil! \n De esta manera sabremos más de usted!",
        type: "success",
        showCancelButton: false,
        confirmButtonColor: "#66CC66",
        confirmButtonText: "Continuar!",
        closeOnConfirm: false
    },
function () {
    swal("Antes de todo!", "Tu usuario será aprobado por al administrador lo antes posible según los datos introducidos. \n Así puedas acceder a las funciones asignadas en el sistema. \n Gracias.", "info");
});
}