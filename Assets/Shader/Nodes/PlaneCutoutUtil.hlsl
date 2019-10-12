#ifndef PLANE_CUTOUT_UTIL_DEFINED
#define PLANE_CUTOUT_UTIL_DEFINED

void IsInFront_float(float3 PlanePosition, float3 PlaneNormal, float3 Position, out bool IsInFront){
	float3 dir = Position - PlanePosition;
	IsInFront = dot(dir, PlaneNormal) > 0;
}


#endif