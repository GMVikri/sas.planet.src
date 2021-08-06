unit RegExprUtils;

interface

{$region 'xmldoc'}
/// <summary>
/// ����� ��������� ���������� ����������
/// </summary>
/// <param name="AStr">�������� ������</param>
/// <param name="AMatchExpr">���. ���������, �� �������� ����������� �����</param>
/// <param name="AMatchID">����� ���������� ���. ��������� (0,1,2 � �.�.)</param>
/// <returns>������� ������ ��� ������ ������, ���� ���������� �� �������</returns>
{$endregion}
function RegExprGetMatchSubStr(const AStr, AMatchExpr: AnsiString; AMatchID: Integer): AnsiString;

{$region 'xmldoc'}
/// <summary>
/// ������ ��������� (����� ����������� ���������� ����������)
/// </summary>
/// <param name="AStr">�������� ������</param>
/// <param name="AMatchExpr">���. ���������, �� �������� ����������� �����</param>
/// <param name="AReplace">������ ������</param>
/// <returns>�������� ������ (���� ���������� �� �������) ��� ��������� ������</returns>
{$endregion}
function RegExprReplaceMatchSubStr(const AStr, AMatchExpr, AReplace: AnsiString): AnsiString;

implementation

uses
  SysUtils,
  RegExpr;

function RegExprGetMatchSubStr(const AStr, AMatchExpr: AnsiString; AMatchID: Integer): AnsiString;
var
  VRegExpr: TRegExpr;
begin
    VRegExpr  := TRegExpr.Create;
  try
    VRegExpr.Expression := AMatchExpr;
    if VRegExpr.Exec(AStr) then
    begin
      if (AMatchID <= VRegExpr.SubExprMatchCount) and (AMatchID >= 0) then
        Result := VRegExpr.Match[AMatchID]
      else
        Result := '';
    end
    else
      Result := '';
  finally
    FreeAndNil(VRegExpr);
  end;
end;

function RegExprReplaceMatchSubStr(const AStr, AMatchExpr, AReplace: AnsiString): AnsiString;
var
  VRegExpr: TRegExpr;
begin
    VRegExpr  := TRegExpr.Create;
  try
    VRegExpr.Expression := AMatchExpr;
    if VRegExpr.Exec(AStr) then
      Result := VRegExpr.Replace(AStr, AReplace, True)
    else
      Result := AStr;
  finally
    FreeAndNil(VRegExpr);
  end;
end;

end.

