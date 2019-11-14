using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteAlways]
[RequireComponent(typeof(Light))]
public class ConeController : MonoBehaviour {

    [SerializeField] private Material[] materials;
    private static readonly int coneTip = Shader.PropertyToID("_ConeTip"); 
    private static readonly int coneDir = Shader.PropertyToID("_ConeDir"); 
    private static readonly int coneHeight = Shader.PropertyToID("_ConeHeight"); 
    private static readonly int coneBaseRadius = Shader.PropertyToID("_ConeBaseRadius");
    private Light spotLight;


    private void Awake() {
        spotLight = GetComponent<Light>();
        if(spotLight.type != LightType.Spot) {
            Debug.LogError("Light is required to be of type 'Spot'.");
        }
    }

    void Update() {
        if(materials == null || materials.Length == 0) return;
        foreach(var material in materials) {
            material.SetVector(coneTip, transform.position);
            material.SetVector(coneDir, transform.forward);
            material.SetFloat(coneHeight, spotLight.range);
            material.SetFloat(coneBaseRadius, spotLight.spotAngle / 35.0f);
        }
    }
}