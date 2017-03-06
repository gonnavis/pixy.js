  vec4 glassPos = vScreenPos;
  glassPos.xy += (geometry.viewDir.xy - geometry.normal.xy) * (glassCurvature * vScreenPos.w);
  glassPos.xy /= glassPos.w;
// vec4 distortionNormal = texture2D(tDistortion, vUv);
// vec3 distortion = (distortionNormal.rgb - vec3(0.5)) * distortionStrength;
  distortionNormal = texture2D(tDistortion, vUv + distortion.xy);
  distortion = distortionNormal.rgb - vec3(0.5);
  glassPos.xy += distortion.xy;
  reflectedLight.directDiffuse = mix(reflectedLight.directDiffuse, texture2D(tBackBuffer, glassPos.xy).rgb, glassStrength);