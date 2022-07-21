unit fCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uClienteController;

type
  TfrmCliente = class(TForm)
  private
    FController: TClienteController;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;
  procedure call_cliente(AId: integer = 0);

implementation

{$R *.dfm}

procedure call_cliente(AId: integer);
begin
  try
    frmCliente := TfrmCliente.Create(nil);
    frmCliente.FController := TClienteController.Create(Aid);
    frmCliente.ShowModal;
  finally
    FreeAndNil(frmCliente);
  end;
end;

end.
