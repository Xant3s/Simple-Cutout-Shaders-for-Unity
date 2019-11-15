using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteAlways]
public class CapsuleController : MonoBehaviour {

    public Material[] materials;
    private static readonly int p1 = Shader.PropertyToID("_P1"); 
    private static readonly int p2 = Shader.PropertyToID("_P2"); 
    private static readonly int r = Shader.PropertyToID("_Radius"); 


    void Update() {
        if(materials == null || materials.Length == 0) return;
        foreach(var material in materials) {
            var position = transform.position;
            var radius = transform.localScale.x;
            var point1 = position + transform.up * transform.localScale.y / 2.0f;
            var point2 = position - transform.up * transform.localScale.y / 2.0f;
            material.SetVector(p1, point1);
            material.SetVector(p2, point2);
            material.SetFloat(r, radius);
        }
    }
}