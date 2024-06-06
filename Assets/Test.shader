Shader "Custom/Test"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _DissolveTex ("Dissolve Texture", 2D) = "white" {}
        _GlowColor ("Glow Color", Color) = (1,1,1,1)
        _GlowIntensity ("Glow Intensity", Range(0,10)) = 1
        _DissolveAmount ("Dissolve Amount", Range(0,1)) = 0
    }
    SubShader
    {
      Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _DissolveTex;
        fixed4 _GlowColor;
        float _GlowIntensity;
        float _DissolveAmount;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_DissolveTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);

            // Dissolve effect
            fixed dissolve = tex2D(_DissolveTex, IN.uv_DissolveTex).r;
            if (dissolve < _DissolveAmount)
            {
                // Make the pixel invisible
                clip(-1);
            }

            // Glow effect
            fixed4 glow = _GlowColor * _GlowIntensity;

            // Combine base color and glow
            o.Albedo = c.rgb + glow.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
