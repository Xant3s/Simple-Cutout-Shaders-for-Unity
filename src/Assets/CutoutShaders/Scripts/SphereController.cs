using UnityEngine;


[ExecuteAlways]
public class SphereController : MonoBehaviour {

    public Material[] materials;
    private static readonly int sphereCutout = Shader.PropertyToID("_SphereCutout"); // XZY: position, W: radius

    private void Update() {
        if(materials == null || materials.Length == 0) return;
        foreach(var material in materials) {
            var pos = transform.position;
            var radius = transform.localScale.x;
            material.SetVector(sphereCutout, new Vector4(pos.x, pos.y, pos.z,radius));
        }
    }
}