using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteAlways]
public class CapsuleController : MonoBehaviour {

    [SerializeField] private Material[] materials;
    private static readonly int p1 = Shader.PropertyToID("_P1"); 
    private static readonly int p2 = Shader.PropertyToID("_P2"); 
    private static readonly int r = Shader.PropertyToID("_Radius"); 

    //private void Start() {
    //    if(!Application.isPlaying) return;
    //    Debug.Log("SADASDASDSDASD");
    //    var position = transform.position;
    //    var point1 = position + transform.up * transform.localScale.y / 2.0f;
    //    var point2 = position - transform.up * transform.localScale.y / 2.0f;
    //    var empty = new GameObject();
    //    var go1 = Instantiate(empty);
    //    var go2 = Instantiate(empty);
    //    go1.transform.position = point1;
    //    go2.transform.position = point2;
    //    Destroy(empty);
    //}


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