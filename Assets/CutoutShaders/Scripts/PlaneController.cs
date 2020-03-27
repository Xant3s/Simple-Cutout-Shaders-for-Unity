using UnityEngine;


[ExecuteAlways]
public class PlaneController: MonoBehaviour {

    public Material[] materials;
    private static readonly int planePosition = Shader.PropertyToID("_PlanePosition");
    private static readonly int planeNormal = Shader.PropertyToID("_PlaneNormal");

    private void Update() {
        if(materials == null || materials.Length == 0) return;
        foreach(var material in materials) {
            material.SetVector(planePosition, transform.position);
            material.SetVector(planeNormal, transform.up);
        }
    }
}