// lr09BitStr.cpp: ���������� ����� ����� ��� ����������� ����������.
//

#include "stdafx.h"
extern "C" void START();

int _tmain(int argc, _TCHAR* argv[])
{

	_asm
	{
		call START
	}

	return 0;
}

