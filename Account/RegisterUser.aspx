<%@ Page Title="" Language="C#" MasterPageFile="~/Account/AccountMASTER.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="SisLIJAD.Account.RegisterUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormContent" runat="server">
<div>
            
        <center>
    
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                              ContinueDestinationPageUrl="~/default.aspx" 
                              DisableCreatedUser="false" 
                              Font-Names="Verdana" 
                              BackColor="white"
                              Font-Size="10pt" 
                              BorderWidth="1px" 
                              BorderColor="#CCCC99" 
                              BorderStyle="Solid"
                              CompleteSuccessText="The account has been successfully created." 
                              UnknownErrorMessage="The account was not created. Please try again."
                              OnCreatedUser="CreateUserWizard1_CreatedUser"> 
            
            <WizardSteps>
            
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Step 1: Basic User Information">
                    <ContentTemplate>
                    
                        <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                            <tr>
                                <td style="font-weight: bold; color: white; background-color: #6b696b" align="center" colspan="2">
                                    Create Your UserID
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">UserID:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ToolTip="User Name is required."
                                        ErrorMessage="User Name is required." ValidationGroup="CreateUserWizard1" ControlToValidate="UserName">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ToolTip="Password is required."
                                        ErrorMessage="Password is required." ValidationGroup="CreateUserWizard1" ControlToValidate="Password">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Re-Type Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ToolTip="Confirm Password is required."
                                        ErrorMessage="Confirm Password is required." ValidationGroup="CreateUserWizard1"
                                        ControlToValidate="ConfirmPassword">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Email:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ToolTip="Email is required."
                                        ErrorMessage="Email is required." ValidationGroup="CreateUserWizard1" ControlToValidate="Email">
                                        *</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                            
                        <br />    
                        <br />
                            
                        <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                            <tr>
                                <td style="font-weight: bold; color: white; background-color: #6b696b" align="center" colspan="2">
                                    If You Forget Your Password
                                </td>
                            </tr>
    
                            <tr>
                                <td align="right">
                                    Security Question:
                                </td>
                                <td>
                                    <asp:DropDownList ID="Question" runat="server" Width="200">
                                        <asp:ListItem Text="[Select a Question]" />
                                        <asp:ListItem Text="Favorite Pet" />
                                        <asp:ListItem Text="Mother's Maiden Name"  />
                                        <asp:ListItem Text="Who was your childhood hero?"  />
                                        <asp:ListItem Text="Your favorite pasttime?"  />
                                    </asp:DropDownList>
                                
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" InitialValue="[Select a Question]" ControlToValidate="Question"
                                        ErrorMessage="Select a Security Question" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="170">
                                    Your Answer:
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="RequiredFieldValidator" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        
                        </table>
                            
                        <br />     
                        <br />
                            
                        <table style="font-size: 10pt; font-family: Verdana" border="0" width="400">
                            <tr>
                                <td style="font-weight: bold; color: white; background-color: #6b696b" align="center" colspan="2">
                                    Help Us Customize Your Experience
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" width="170">
                                    Country:</td>
                                <td>
                                    <asp:DropDownList ID="Country" runat="server">
                                        <asp:ListItem Text="[Select a Country]" />
                                        <asp:ListItem Text="Albania" />
                                        <asp:ListItem Text="Austria"  />
                                        <asp:ListItem Text="Austrailia"  />
                                        <asp:ListItem Text="Belgium"  />
                                        <asp:ListItem Text="Other" />
                                    </asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="[Select a Country]" ControlToValidate="Country"
                                        ErrorMessage="Select a Country" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Gender:</td>
                                <td>
                                    <asp:DropDownList ID="Gender" runat="server">
                                        <asp:ListItem Text="[Select Gender]" />
                                        <asp:ListItem Text="Male" />
                                        <asp:ListItem Text="Female"  />
                                    </asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="[Select Gender]" ControlToValidate="Gender"
                                        ErrorMessage="Select Gender" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Age:</td>
                                <td>
                                    <asp:TextBox ID="Age" runat="server"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Age"
                                        ErrorMessage="Enter Age" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        
                                    <asp:RangeValidator ID="RangeValidator1" Type="Integer" ControlToValidate="Age" MinimumValue="1" MaximumValue="120" runat="server" ValidationGroup="CreateUserWizard1" ErrorMessage="Not a valid number">*</asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ErrorMessage="The Password and Confirmation Password must match."
                                        ValidationGroup="CreateUserWizard1" ControlToValidate="ConfirmPassword" ControlToCompare="Password"
                                        Display="Dynamic">
                                    </asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: red" align="center" colspan="2">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                
                <asp:WizardStep runat="server" ID="wsAssignUserToRoles" AllowReturn="False" Title="Step 2: Assign User To Roles"
                    OnActivate="AssignUserToRoles_Activate" OnDeactivate="AssignUserToRoles_Deactivate">
                    <table>
                        <tr>
                            <td>
                                Select one or more roles for the user:</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ListBox ID="AvailableRoles" runat="server" SelectionMode="Multiple" Height="104px" Width="264px"></asp:ListBox>
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
                
            <TitleTextStyle Font-Bold="True" BackColor="#6B696B" ForeColor="White"></TitleTextStyle>
        
        </asp:CreateUserWizard>
        
        </center>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GridContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PopupContent" runat="server">
</asp:Content>
