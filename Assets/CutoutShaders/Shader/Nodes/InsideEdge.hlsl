#ifndef INSIDE_EDGE_DEFINED
#define INSIDE_EDGE_DEFINED

void IsInsideEdge_float(float distance, float edgeThickness, bool isInverted, out bool isInsideEdge) {
    if(isInverted) {
        isInsideEdge = distance > 0 && distance <= edgeThickness;
    } else{
        isInsideEdge = distance <= 0 && abs(distance) <= edgeThickness;
    }
}

#endif