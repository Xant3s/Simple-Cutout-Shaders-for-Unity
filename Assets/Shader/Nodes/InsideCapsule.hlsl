#ifndef INSIDE_CAPSULE_DEFINED
#define INSIDE_CAPSULE_DEFINED

bool IsInsideSphere(float3 Center, float Radius, float3 Position){
    return distance(Center, Position) <= Radius;
}

void IsInsideCapsule_float(float3 P1, float3 P2, float Radius, float3 Position, out bool Out){
    if(IsInsideSphere(P1, Radius, Position) || IsInsideSphere(P2, Radius, Position)){
        Out = true;
        return;
    }

    float3 pDir = Position - P1;
    float3 direction = P2 - P1;
    float d = dot(direction, pDir);
    float lengthsq = length(direction) * length(direction);

    if(d < 0 || d > lengthsq){
        Out = false;
        return;
    }

    float dsq = pDir[0] * pDir[0] + pDir[1] * pDir[1] + pDir[2] * pDir[2] - d * d / lengthsq;
    Out = !(dsq > Radius * Radius);
}

#endif