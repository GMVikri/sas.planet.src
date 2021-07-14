{******************************************************************************}
{* SAS.Planet (SAS.�������)                                                   *}
{* Copyright (C) 2007-2014, SAS.Planet development team.                      *}
{* This program is free software: you can redistribute it and/or modify       *}
{* it under the terms of the GNU General Public License as published by       *}
{* the Free Software Foundation, either version 3 of the License, or          *}
{* (at your option) any later version.                                        *}
{*                                                                            *}
{* This program is distributed in the hope that it will be useful,            *}
{* but WITHOUT ANY WARRANTY; without even the implied warranty of             *}
{* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *}
{* GNU General Public License for more details.                               *}
{*                                                                            *}
{* You should have received a copy of the GNU General Public License          *}
{* along with this program.  If not, see <http://www.gnu.org/licenses/>.      *}
{*                                                                            *}
{* http://sasgis.org                                                          *}
{* info@sasgis.org                                                            *}
{******************************************************************************}

unit u_GlobalAppConfig;

interface

uses
  i_GlobalAppConfig,
  i_ConfigDataProvider,
  i_ConfigDataWriteProvider,
  u_ConfigDataElementBase;

type
  TGlobalAppConfig = class(TConfigDataElementBase, IGlobalAppConfig)
  private
    FIsShowIconInTray: Boolean;
  protected
    procedure DoReadConfig(const AConfigData: IConfigDataProvider); override;
    procedure DoWriteConfig(const AConfigData: IConfigDataWriteProvider); override;
  private
    function GetIsShowIconInTray: Boolean;
    procedure SetIsShowIconInTray(AValue: Boolean);
  public
    constructor Create;
  end;

implementation

{ TGlobalAppConfig }

constructor TGlobalAppConfig.Create;
begin
  inherited Create;
  FIsShowIconInTray := False;
end;

procedure TGlobalAppConfig.DoReadConfig(const AConfigData: IConfigDataProvider);
begin
  inherited;
  if AConfigData <> nil then begin
    FIsShowIconInTray := AConfigData.ReadBool('ShowIconInTray', FIsShowIconInTray);
    SetChanged;
  end;
end;

procedure TGlobalAppConfig.DoWriteConfig(const AConfigData: IConfigDataWriteProvider);
begin
  inherited;
  AConfigData.WriteBool('ShowIconInTray', FIsShowIconInTray);
end;

function TGlobalAppConfig.GetIsShowIconInTray: Boolean;
begin
  LockRead;
  try
    Result := FIsShowIconInTray;
  finally
    UnlockRead;
  end;
end;

procedure TGlobalAppConfig.SetIsShowIconInTray(AValue: Boolean);
begin
  LockWrite;
  try
    if FIsShowIconInTray <> AValue then begin
      FIsShowIconInTray := AValue;
      SetChanged;
    end;
  finally
    UnlockWrite;
  end;
end;

end.
