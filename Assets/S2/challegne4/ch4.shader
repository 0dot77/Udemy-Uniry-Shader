Shader "Holistic/ch4"
{
    Properties
    {
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
        }
        ENDCG
    }
    FallBack "Diffuse"
}
