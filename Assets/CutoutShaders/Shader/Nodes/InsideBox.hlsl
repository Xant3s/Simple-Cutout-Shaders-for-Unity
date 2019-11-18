#ifndef BOXINSIDE_INCLUDED
#define BOXINSIDE_INCLUDED

#include "./PlaneCutoutUtil.hlsl"

void IsInsideBox_float(float3 BoxPosition, float4x4 BoxRotationMatrix, float3 BoxScale, float3 Position, out bool Out){
	float3 localRight = {1, 0, 0};
	float3 localUp =  {0, 1, 0};
	float3 localFront = {0, 0, -1};
	localRight = mul(BoxRotationMatrix, float4(localRight, 0)).xyz;
	localUp = mul(BoxRotationMatrix, float4(localUp, 0)).xyz;
	localFront = mul(BoxRotationMatrix, float4(localFront, 0)).xyz;

	float3 normalRight = (BoxPosition + localRight) - BoxPosition;
	float3 normalLeft = (BoxPosition - localRight) - BoxPosition;
	float3 normalUp = (BoxPosition + localUp) - BoxPosition;
	float3 normalDown = (BoxPosition - localUp) - BoxPosition;
	float3 normalFront = (BoxPosition + localFront) - BoxPosition;
	float3 normalBack = (BoxPosition - localFront) - BoxPosition;

	float3 rightPlanePos = BoxPosition + normalRight * BoxScale[0] / 2.0;
	float3 leftPlanePos = BoxPosition + normalLeft * BoxScale[0] / 2.0;
	float3 upPlanePos = BoxPosition + normalUp * BoxScale[0] / 2.0;
	float3 downPlanePos = BoxPosition + normalDown * BoxScale[0] / 2.0;
	float3 frontPlanePos = BoxPosition + normalFront * BoxScale[0] / 2.0;
	float3 backPlanePos = BoxPosition + normalBack * BoxScale[0] / 2.0;

	bool isInFrontOfRightPlane;
	bool isInFrontOfLeftPlane;
	bool isInFrontOfUpPlane;
	bool isInFrontOfDownPlane;
	bool isInFrontOfFrontPlane;
	bool isInFrontOfBackPlane;

	IsInFront_float(rightPlanePos, normalRight, Position, isInFrontOfRightPlane);
	IsInFront_float(leftPlanePos, normalLeft, Position, isInFrontOfLeftPlane);
	IsInFront_float(upPlanePos, normalUp, Position, isInFrontOfUpPlane);
	IsInFront_float(downPlanePos, normalDown, Position, isInFrontOfDownPlane);
	IsInFront_float(frontPlanePos, normalFront, Position, isInFrontOfFrontPlane);
	IsInFront_float(backPlanePos, normalBack, Position, isInFrontOfBackPlane);

	Out = !isInFrontOfRightPlane && !isInFrontOfLeftPlane &&
			!isInFrontOfUpPlane && !isInFrontOfDownPlane &&
			!isInFrontOfFrontPlane && !isInFrontOfBackPlane;
}

void GetDistanceToBox_float(float3 BoxPosition, float4x4 BoxRotationMatrix, float3 BoxScale, float3 Position, bool isInverted, out float Distance){
	float3 localRight = {1, 0, 0};
	float3 localUp =  {0, 1, 0};
	float3 localFront = {0, 0, -1};
	localRight = mul(BoxRotationMatrix, float4(localRight, 0)).xyz;
	localUp = mul(BoxRotationMatrix, float4(localUp, 0)).xyz;
	localFront = mul(BoxRotationMatrix, float4(localFront, 0)).xyz;

	float3 normalRight = (BoxPosition + localRight) - BoxPosition;
	float3 normalLeft = (BoxPosition - localRight) - BoxPosition;
	float3 normalUp = (BoxPosition + localUp) - BoxPosition;
	float3 normalDown = (BoxPosition - localUp) - BoxPosition;
	float3 normalFront = (BoxPosition + localFront) - BoxPosition;
	float3 normalBack = (BoxPosition - localFront) - BoxPosition;

	float3 rightPlanePos = BoxPosition + normalRight * BoxScale[0] / 2.0;
	float3 leftPlanePos = BoxPosition + normalLeft * BoxScale[0] / 2.0;
	float3 upPlanePos = BoxPosition + normalUp * BoxScale[0] / 2.0;
	float3 downPlanePos = BoxPosition + normalDown * BoxScale[0] / 2.0;
	float3 frontPlanePos = BoxPosition + normalFront * BoxScale[0] / 2.0;
	float3 backPlanePos = BoxPosition + normalBack * BoxScale[0] / 2.0;

	float distanceToRightPlane;
	float distanceToLeftPlane;
	float distanceToUpPlane;
	float distanceToDownPlane;
	float distanceToFrontPlane;
	float distanceToBackPlane;

	GetDistanceToPlane_float(rightPlanePos, normalRight, Position, distanceToRightPlane);
	GetDistanceToPlane_float(leftPlanePos, normalLeft, Position, distanceToLeftPlane);
	GetDistanceToPlane_float(upPlanePos, normalUp, Position, distanceToUpPlane);
	GetDistanceToPlane_float(downPlanePos, normalDown, Position, distanceToDownPlane);
	GetDistanceToPlane_float(frontPlanePos, normalFront, Position, distanceToFrontPlane);
	GetDistanceToPlane_float(backPlanePos, normalBack, Position, distanceToBackPlane);

	float distances [6] = {distanceToRightPlane, distanceToLeftPlane, distanceToUpPlane, 
							distanceToDownPlane, distanceToFrontPlane, distanceToBackPlane};
	Distance = 0;
	for(int i = 0; i < 6; i++){
		Distance = max(Distance, distances[i]);
	}

	Distance *= (-1 * !isInverted) + (1 * isInverted);
}

#endif