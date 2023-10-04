function Luv = xyztoLuv(XYZ, XYZw)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eps = 0.008856;
k = 903.3;

X = XYZ(:, 1);
Y = XYZ(:, 2);
Z = XYZ(:, 3);

Xr = XYZw(:, 1);
Yr = XYZw(:, 2);
Zr = XYZw(:, 3);

up = (4.*X)./(X + 15.*Y + 3.*Z);
vp = (9.*Y)./(X + 15.*Y + 3.*Z);

upr = (4.*Xr)./(Xr + 15.*Yr + 3.*Zr);
vpr = (9.*Yr)./(Xr + 15.*Yr + 3.*Zr);

yr = Y ./ Yr;

L(yr >= eps) = k.*yr(yr >= eps);
L(yr < eps) = 116.*(yr(yr < eps)).^(1/3) - 16;

u = 13.*L'.*(up - upr);
v = 13.*L'.*(vp - vpr);

Luv = [L' u v];