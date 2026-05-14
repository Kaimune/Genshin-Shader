Shader "Introduction/FirstShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color("Test Color", color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert // runs on every vert
            #pragma fragment frag // runs on every pixel

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f // vert to fragment
            {
                float4 vertex : SV_POSITION;
            };

            fixed4 _Color;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex); // Model View Projection matrix
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = _Color;
                return col;
            }
            ENDCG
        }
    }
}
