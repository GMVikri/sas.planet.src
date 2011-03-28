unit fr_ExportYaMaps;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  CheckLst,
  Spin,
  ExtCtrls,
  u_CommonFormAndFrameParents;

type
  TfrExportYaMaps = class(TFrame)
    pnlCenter: TPanel;
    pnlTop: TPanel;
    lblTargetPath: TLabel;
    edtTargetPath: TEdit;
    btnSelectTargetPath: TButton;
    chkReplaseTiles: TCheckBox;
    pnlRight: TPanel;
    lblZooms: TLabel;
    chklstZooms: TCheckListBox;
    pnlMapsSelect: TPanel;
    grdpnlMaps: TGridPanel;
    lblMapCompress: TLabel;
    seMapCompress: TSpinEdit;
    seSatCompress: TSpinEdit;
    cbbHybr: TComboBox;
    cbbMap: TComboBox;
    cbbSat: TComboBox;
    lblSatCompress: TLabel;
    lblCompress: TLabel;
    lblHybr: TLabel;
    lblMap: TLabel;
    lblSat: TLabel;
    lblMaps: TLabel;
    procedure btnSelectTargetPathClick(Sender: TObject);
  private
  public
    procedure Init;
  end;

implementation

uses
  FileCtrl,
  u_GlobalState,
  u_ResStrings,
  UMapType;

{$R *.dfm}

procedure TfrExportYaMaps.btnSelectTargetPathClick(Sender: TObject);
var
  TempPath: string;
begin
  if SelectDirectory('', '', TempPath) then begin
    edtTargetPath.Text := IncludeTrailingPathDelimiter(TempPath);
  end;
end;

procedure TfrExportYaMaps.Init;
var
  i: integer;
  VMapType: TMapType;
  VActiveMapGUID: TGUID;
  VAddedIndex: Integer;
begin
  chklstZooms.Items.Clear;
  for i:=1 to 24 do begin
    chklstZooms.Items.Add(inttostr(i));
  end;

  VActiveMapGUID := GState.MainFormConfig.MainMapsConfig.GetActiveMap.GetSelectedGUID;
  cbbSat.items.Clear;
  cbbMap.items.Clear;
  cbbHybr.items.Clear;
  cbbSat.Items.AddObject(SAS_STR_No,nil);
  cbbMap.Items.AddObject(SAS_STR_No,nil);
  cbbHybr.Items.AddObject(SAS_STR_No,nil);
  For i:=0 to GState.MapType.Count-1 do begin
    VMapType := GState.MapType[i];
    if (VMapType.IsBitmapTiles)and(VMapType.Enabled) then begin
      if (not(VMapType.asLayer)) then begin
        VAddedIndex := cbbSat.Items.AddObject(VMapType.name,VMapType);
        if IsEqualGUID(VMapType.GUID, VActiveMapGUID) then begin
          cbbSat.ItemIndex:=VAddedIndex;
        end;
        VAddedIndex := cbbMap.Items.AddObject(VMapType.name,VMapType);
        if IsEqualGUID(VMapType.GUID, VActiveMapGUID) then begin
          cbbMap.ItemIndex:=VAddedIndex;
        end;
      end else if(VMapType.IsHybridLayer) then begin
        VAddedIndex := cbbHybr.Items.AddObject(VMapType.name,VMapType);
        if (cbbHybr.ItemIndex=-1) then begin
          if GState.MainFormConfig.MainMapsConfig.GetLayers.IsGUIDSelected(VMapType.GUID) then begin
            cbbHybr.ItemIndex:=VAddedIndex;
          end;
        end;
      end;
    end;
  end;
  if cbbSat.ItemIndex=-1 then cbbSat.ItemIndex:=1;
  if cbbMap.ItemIndex=-1 then cbbMap.ItemIndex:=0;
  if cbbHybr.ItemIndex=-1 then cbbHybr.ItemIndex:=0;
end;

end.
