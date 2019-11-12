#ifndef INSIDE_CONE_DEFINED
#define INSIDE_CONE_DEFINED

void IsInsideCone_float(float3 ConeTip, float3 ConeDir, float ConeHeight, float ConeBaseRadius, float3 Position, out bool Out){
    float3 coneDist = dot(Position - ConeTip, ConeDir);
    int outside = coneDist > ConeHeight || coneDist < 0;
    if(outside) {
        Out = false;
        return;
    }

    float coneRadius = (coneDist / ConeHeight) * ConeBaseRadius;
    float orthDistance = length((Position - ConeTip) - coneDist * ConeDir);
    Out = orthDistance < coneRadius;
}

#endif