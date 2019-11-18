#ifndef INSIDE_EDGE_DEFINED
#define INSIDE_EDGE_DEFINED

void IsInsideEdge_float(float distance, float edgeThickness, bool isInverted, out bool isInsideEdge) {
    isInsideEdge = distance <= edgeThickness - 1 * !isInverted + 0.5f * isInverted;
}

#endif