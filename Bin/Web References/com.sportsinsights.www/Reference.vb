﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.1
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Serialization

'
'This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.1.
'
Namespace com.sportsinsights.www
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1"),  _
     System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code"),  _
     System.Web.Services.WebServiceBindingAttribute(Name:="DataServiceSoap", [Namespace]:="http://data.sportsinsights.com/")>  _
    Partial Public Class DataService
        Inherits System.Web.Services.Protocols.SoapHttpClientProtocol
        
        Private LineFeedOperationCompleted As System.Threading.SendOrPostCallback
        
        Private OpenerFeedOperationCompleted As System.Threading.SendOrPostCallback
        
        Private InjuryFeedOperationCompleted As System.Threading.SendOrPostCallback
        
        Private ScoreFeedOperationCompleted As System.Threading.SendOrPostCallback
        
        Private useDefaultCredentialsSetExplicitly As Boolean
        
        '''<remarks/>
        Public Sub New()
            MyBase.New
            Me.Url = Global.Bin.My.MySettings.Default.Bin_com_sportsinsights_www_DataService
            If (Me.IsLocalFileSystemWebService(Me.Url) = true) Then
                Me.UseDefaultCredentials = true
                Me.useDefaultCredentialsSetExplicitly = false
            Else
                Me.useDefaultCredentialsSetExplicitly = true
            End If
        End Sub
        
        Public Shadows Property Url() As String
            Get
                Return MyBase.Url
            End Get
            Set
                If (((Me.IsLocalFileSystemWebService(MyBase.Url) = true)  _
                            AndAlso (Me.useDefaultCredentialsSetExplicitly = false))  _
                            AndAlso (Me.IsLocalFileSystemWebService(value) = false)) Then
                    MyBase.UseDefaultCredentials = false
                End If
                MyBase.Url = value
            End Set
        End Property
        
        Public Shadows Property UseDefaultCredentials() As Boolean
            Get
                Return MyBase.UseDefaultCredentials
            End Get
            Set
                MyBase.UseDefaultCredentials = value
                Me.useDefaultCredentialsSetExplicitly = true
            End Set
        End Property
        
        '''<remarks/>
        Public Event LineFeedCompleted As LineFeedCompletedEventHandler
        
        '''<remarks/>
        Public Event OpenerFeedCompleted As OpenerFeedCompletedEventHandler
        
        '''<remarks/>
        Public Event InjuryFeedCompleted As InjuryFeedCompletedEventHandler
        
        '''<remarks/>
        Public Event ScoreFeedCompleted As ScoreFeedCompletedEventHandler
        
        '''<remarks/>
        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://data.sportsinsights.com/LineFeed", RequestNamespace:="http://data.sportsinsights.com/", ResponseNamespace:="http://data.sportsinsights.com/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function LineFeed(ByVal LastRequest As Double, ByVal SubscriberKey As String) As System.Xml.XmlNode
            Dim results() As Object = Me.Invoke("LineFeed", New Object() {LastRequest, SubscriberKey})
            Return CType(results(0),System.Xml.XmlNode)
        End Function
        
        '''<remarks/>
        Public Overloads Sub LineFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String)
            Me.LineFeedAsync(LastRequest, SubscriberKey, Nothing)
        End Sub
        
        '''<remarks/>
        Public Overloads Sub LineFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String, ByVal userState As Object)
            If (Me.LineFeedOperationCompleted Is Nothing) Then
                Me.LineFeedOperationCompleted = AddressOf Me.OnLineFeedOperationCompleted
            End If
            Me.InvokeAsync("LineFeed", New Object() {LastRequest, SubscriberKey}, Me.LineFeedOperationCompleted, userState)
        End Sub
        
        Private Sub OnLineFeedOperationCompleted(ByVal arg As Object)
            If (Not (Me.LineFeedCompletedEvent) Is Nothing) Then
                Dim invokeArgs As System.Web.Services.Protocols.InvokeCompletedEventArgs = CType(arg,System.Web.Services.Protocols.InvokeCompletedEventArgs)
                RaiseEvent LineFeedCompleted(Me, New LineFeedCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState))
            End If
        End Sub
        
        '''<remarks/>
        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://data.sportsinsights.com/OpenerFeed", RequestNamespace:="http://data.sportsinsights.com/", ResponseNamespace:="http://data.sportsinsights.com/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function OpenerFeed(ByVal LastRequest As Double, ByVal SubscriberKey As String) As System.Xml.XmlNode
            Dim results() As Object = Me.Invoke("OpenerFeed", New Object() {LastRequest, SubscriberKey})
            Return CType(results(0),System.Xml.XmlNode)
        End Function
        
        '''<remarks/>
        Public Overloads Sub OpenerFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String)
            Me.OpenerFeedAsync(LastRequest, SubscriberKey, Nothing)
        End Sub
        
        '''<remarks/>
        Public Overloads Sub OpenerFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String, ByVal userState As Object)
            If (Me.OpenerFeedOperationCompleted Is Nothing) Then
                Me.OpenerFeedOperationCompleted = AddressOf Me.OnOpenerFeedOperationCompleted
            End If
            Me.InvokeAsync("OpenerFeed", New Object() {LastRequest, SubscriberKey}, Me.OpenerFeedOperationCompleted, userState)
        End Sub
        
        Private Sub OnOpenerFeedOperationCompleted(ByVal arg As Object)
            If (Not (Me.OpenerFeedCompletedEvent) Is Nothing) Then
                Dim invokeArgs As System.Web.Services.Protocols.InvokeCompletedEventArgs = CType(arg,System.Web.Services.Protocols.InvokeCompletedEventArgs)
                RaiseEvent OpenerFeedCompleted(Me, New OpenerFeedCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState))
            End If
        End Sub
        
        '''<remarks/>
        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://data.sportsinsights.com/InjuryFeed", RequestNamespace:="http://data.sportsinsights.com/", ResponseNamespace:="http://data.sportsinsights.com/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function InjuryFeed(ByVal LastRequest As Double, ByVal SubscriberKey As String) As System.Xml.XmlNode
            Dim results() As Object = Me.Invoke("InjuryFeed", New Object() {LastRequest, SubscriberKey})
            Return CType(results(0),System.Xml.XmlNode)
        End Function
        
        '''<remarks/>
        Public Overloads Sub InjuryFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String)
            Me.InjuryFeedAsync(LastRequest, SubscriberKey, Nothing)
        End Sub
        
        '''<remarks/>
        Public Overloads Sub InjuryFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String, ByVal userState As Object)
            If (Me.InjuryFeedOperationCompleted Is Nothing) Then
                Me.InjuryFeedOperationCompleted = AddressOf Me.OnInjuryFeedOperationCompleted
            End If
            Me.InvokeAsync("InjuryFeed", New Object() {LastRequest, SubscriberKey}, Me.InjuryFeedOperationCompleted, userState)
        End Sub
        
        Private Sub OnInjuryFeedOperationCompleted(ByVal arg As Object)
            If (Not (Me.InjuryFeedCompletedEvent) Is Nothing) Then
                Dim invokeArgs As System.Web.Services.Protocols.InvokeCompletedEventArgs = CType(arg,System.Web.Services.Protocols.InvokeCompletedEventArgs)
                RaiseEvent InjuryFeedCompleted(Me, New InjuryFeedCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState))
            End If
        End Sub
        
        '''<remarks/>
        <System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://data.sportsinsights.com/ScoreFeed", RequestNamespace:="http://data.sportsinsights.com/", ResponseNamespace:="http://data.sportsinsights.com/", Use:=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle:=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)>  _
        Public Function ScoreFeed(ByVal LastRequest As Double, ByVal SubscriberKey As String) As System.Xml.XmlNode
            Dim results() As Object = Me.Invoke("ScoreFeed", New Object() {LastRequest, SubscriberKey})
            Return CType(results(0),System.Xml.XmlNode)
        End Function
        
        '''<remarks/>
        Public Overloads Sub ScoreFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String)
            Me.ScoreFeedAsync(LastRequest, SubscriberKey, Nothing)
        End Sub
        
        '''<remarks/>
        Public Overloads Sub ScoreFeedAsync(ByVal LastRequest As Double, ByVal SubscriberKey As String, ByVal userState As Object)
            If (Me.ScoreFeedOperationCompleted Is Nothing) Then
                Me.ScoreFeedOperationCompleted = AddressOf Me.OnScoreFeedOperationCompleted
            End If
            Me.InvokeAsync("ScoreFeed", New Object() {LastRequest, SubscriberKey}, Me.ScoreFeedOperationCompleted, userState)
        End Sub
        
        Private Sub OnScoreFeedOperationCompleted(ByVal arg As Object)
            If (Not (Me.ScoreFeedCompletedEvent) Is Nothing) Then
                Dim invokeArgs As System.Web.Services.Protocols.InvokeCompletedEventArgs = CType(arg,System.Web.Services.Protocols.InvokeCompletedEventArgs)
                RaiseEvent ScoreFeedCompleted(Me, New ScoreFeedCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState))
            End If
        End Sub
        
        '''<remarks/>
        Public Shadows Sub CancelAsync(ByVal userState As Object)
            MyBase.CancelAsync(userState)
        End Sub
        
        Private Function IsLocalFileSystemWebService(ByVal url As String) As Boolean
            If ((url Is Nothing)  _
                        OrElse (url Is String.Empty)) Then
                Return false
            End If
            Dim wsUri As System.Uri = New System.Uri(url)
            If ((wsUri.Port >= 1024)  _
                        AndAlso (String.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) = 0)) Then
                Return true
            End If
            Return false
        End Function
    End Class
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")>  _
    Public Delegate Sub LineFeedCompletedEventHandler(ByVal sender As Object, ByVal e As LineFeedCompletedEventArgs)
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1"),  _
     System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code")>  _
    Partial Public Class LineFeedCompletedEventArgs
        Inherits System.ComponentModel.AsyncCompletedEventArgs
        
        Private results() As Object
        
        Friend Sub New(ByVal results() As Object, ByVal exception As System.Exception, ByVal cancelled As Boolean, ByVal userState As Object)
            MyBase.New(exception, cancelled, userState)
            Me.results = results
        End Sub
        
        '''<remarks/>
        Public ReadOnly Property Result() As System.Xml.XmlNode
            Get
                Me.RaiseExceptionIfNecessary
                Return CType(Me.results(0),System.Xml.XmlNode)
            End Get
        End Property
    End Class
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")>  _
    Public Delegate Sub OpenerFeedCompletedEventHandler(ByVal sender As Object, ByVal e As OpenerFeedCompletedEventArgs)
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1"),  _
     System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code")>  _
    Partial Public Class OpenerFeedCompletedEventArgs
        Inherits System.ComponentModel.AsyncCompletedEventArgs
        
        Private results() As Object
        
        Friend Sub New(ByVal results() As Object, ByVal exception As System.Exception, ByVal cancelled As Boolean, ByVal userState As Object)
            MyBase.New(exception, cancelled, userState)
            Me.results = results
        End Sub
        
        '''<remarks/>
        Public ReadOnly Property Result() As System.Xml.XmlNode
            Get
                Me.RaiseExceptionIfNecessary
                Return CType(Me.results(0),System.Xml.XmlNode)
            End Get
        End Property
    End Class
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")>  _
    Public Delegate Sub InjuryFeedCompletedEventHandler(ByVal sender As Object, ByVal e As InjuryFeedCompletedEventArgs)
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1"),  _
     System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code")>  _
    Partial Public Class InjuryFeedCompletedEventArgs
        Inherits System.ComponentModel.AsyncCompletedEventArgs
        
        Private results() As Object
        
        Friend Sub New(ByVal results() As Object, ByVal exception As System.Exception, ByVal cancelled As Boolean, ByVal userState As Object)
            MyBase.New(exception, cancelled, userState)
            Me.results = results
        End Sub
        
        '''<remarks/>
        Public ReadOnly Property Result() As System.Xml.XmlNode
            Get
                Me.RaiseExceptionIfNecessary
                Return CType(Me.results(0),System.Xml.XmlNode)
            End Get
        End Property
    End Class
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")>  _
    Public Delegate Sub ScoreFeedCompletedEventHandler(ByVal sender As Object, ByVal e As ScoreFeedCompletedEventArgs)
    
    '''<remarks/>
    <System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1"),  _
     System.Diagnostics.DebuggerStepThroughAttribute(),  _
     System.ComponentModel.DesignerCategoryAttribute("code")>  _
    Partial Public Class ScoreFeedCompletedEventArgs
        Inherits System.ComponentModel.AsyncCompletedEventArgs
        
        Private results() As Object
        
        Friend Sub New(ByVal results() As Object, ByVal exception As System.Exception, ByVal cancelled As Boolean, ByVal userState As Object)
            MyBase.New(exception, cancelled, userState)
            Me.results = results
        End Sub
        
        '''<remarks/>
        Public ReadOnly Property Result() As System.Xml.XmlNode
            Get
                Me.RaiseExceptionIfNecessary
                Return CType(Me.results(0),System.Xml.XmlNode)
            End Get
        End Property
    End Class
End Namespace
