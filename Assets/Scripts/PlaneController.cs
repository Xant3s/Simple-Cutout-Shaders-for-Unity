using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteAlways]
public class PlaneController: MonoBehaviour {

    [SerializeField] private Material[] materials;
    private static readonly int planePosition = Shader.PropertyToID("_PlanePosition");
    private static readonly int planeNormal = Shader.PropertyToID("_PlaneNormal");

    void Update() {
        if(materials.Length == 0) return;
        foreach(var material in materials) {
            material.SetVector(planePosition, transform.position);
            material.SetVector(planeNormal, transform.up);
        }
    }
}