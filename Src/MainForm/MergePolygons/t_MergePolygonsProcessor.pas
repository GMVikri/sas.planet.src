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

unit t_MergePolygonsProcessor;

interface

uses
  i_GeometryLonLat,
  i_VectorDataItemSimple;

type
  TMergeOperation = (moAND, moOR, moNOT, moXOR, moGroup);

  TMergePolygonsItem = record
    Name: string;
    VectorData: IVectorDataItem;
    MultiPolygon: IGeometryLonLatMultiPolygon;
    SinglePolygon: IGeometryLonLatSinglePolygon;
  end;
  PMergePolygonsItem = ^TMergePolygonsItem;
  
  TMergePolygonsItemArray = array of TMergePolygonsItem;

  TOnMergeFinished = procedure(
    const AVectorItem: IVectorDataItem;
    const APolygonsCount: Integer;
    const AHolesCount: Integer;
    const APerformanceInfo: string
  ) of object;

implementation

end.