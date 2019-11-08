using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteAlways]
public class SphereController : MonoBehaviour {

    [SerializeField] private Material[] materials;
    private static readonly int sphereCutout = Shader.PropertyToID("Vector4_DAB288F5"); // XZY: position, W: radius

    void Update() {
        if(materials == null || materials.Length == 0) return;
        foreach(var material in materials) {
            var pos = transform.position;
            var radius = transform.localScale.x;
            material.SetVector(sphereCutout, new Vector4(pos.x, pos.y, pos.z,radius));
        }
    }
}