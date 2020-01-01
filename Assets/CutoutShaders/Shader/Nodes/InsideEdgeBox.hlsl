#ifndef INSIDE_EDGE_DEFINED
#define INSIDE_EDGE_DEFINED

void IsInsideEdgeBox_float(float distance, float edgeThickness, bool isInverted, out bool isInsideEdge) {
    // isInsideEdge = distance <= edgeThickness + ((- 1 * !isInverted) + (0.6f * isInverted));
    // isInsideEdge = (distance <= edgeThickness) + (1 * !isInverted) + (-1 * isInverted);
    isInsideEdge = abs(distance) <= edgeThickness;
}

#endif