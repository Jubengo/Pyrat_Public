#include <fenv.h>
#pragma STDC FENV_ACCESS ON

void rnd_near()
{
  fesetround(FE_TONEAREST);
}

void rnd_zero()
{
  fesetround(FE_TOWARDZERO);
}

void rnd_upinf()
{
  fesetround(FE_UPWARD);
}

void rnd_downinf()
{
  fesetround(FE_DOWNWARD);
}