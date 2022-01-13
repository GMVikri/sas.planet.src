{******************************************************************************}
{* This file is part of SAS.Planet project.                                   *}
{*                                                                            *}
{* Copyright (C) 2007-2022, SAS.Planet development team.                      *}
{*                                                                            *}
{* SAS.Planet is free software: you can redistribute it and/or modify         *}
{* it under the terms of the GNU General Public License as published by       *}
{* the Free Software Foundation, either version 3 of the License, or          *}
{* (at your option) any later version.                                        *}
{*                                                                            *}
{* SAS.Planet is distributed in the hope that it will be useful,              *}
{* but WITHOUT ANY WARRANTY; without even the implied warranty of             *}
{* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               *}
{* GNU General Public License for more details.                               *}
{*                                                                            *}
{* You should have received a copy of the GNU General Public License          *}
{* along with SAS.Planet. If not, see <http://www.gnu.org/licenses/>.         *}
{*                                                                            *}
{* https://github.com/sasgis/sas.planet.src                                   *}
{******************************************************************************}

unit i_MapSvcScanStorage;

interface

type
  IMapSvcScanStorage = interface
    ['{2320B6DB-151D-4602-8265-33D4BEAA34D6}']
    // check if storage available
    function Available: Boolean;
    // check if image exists (and returns fetch date if requested)
    function ItemExists(
      const AServiceName: String;
      const AIdentifier: string;
      const AFetchedDate: PDateTime
    ): Boolean;
    // add image to storage
    function AddItem(
      const AServiceName: String;
      const AIdentifier: string;
      const AFetchedDate: TDateTime
    ): Boolean;
    function GetScanDate(
      const AVersionId: string
    ): string;
    function AddImageDate(
      const AVersionId: string;
      const ADateDime: string;
      const AX: Double;
      const AY: Double;
      const AZoom: Byte
    ): Boolean;
  end;

implementation

end.