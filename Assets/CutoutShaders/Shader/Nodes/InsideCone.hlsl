#ifndef INSIDE_CONE_DEFINED
#define INSIDE_CONE_DEFINED


void IsInsideCone_float(float3 coneTip, float3 coneDir, float coneHeight, float coneBaseRadius, float3 position, out bool isInside){
    float3 coneDist = dot(position - coneTip, coneDir);
    int outside = coneDist > coneHeight || coneDist < 0;
    if(outside) {
        isInside = false;
        return;
    }

    float coneRadius = (coneDist / coneHeight) * radians(coneBaseRadius);
    float orthDistance = length((position - coneTip) - coneDist * coneDir);
    isInside = orthDistance < coneRadius;
}

void GetDistanceToCone_float(float3 coneTip, float3 coneDir, float coneHeight, float coneBaseRadius, float3 position, out float distanceToCone) {
    float coneDist = dot(position - coneTip, coneDir);
    float coneRadius = (coneDist / coneHeight) * radians(coneBaseRadius);
    float orthDistance = length((position - coneTip) - coneDist * coneDir);
    distanceToCone = orthDistance - coneRadius;
}

#endif